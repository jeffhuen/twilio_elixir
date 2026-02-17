defmodule Twilio.Client do
  @moduledoc """
  Twilio API client. Holds credentials and executes requests.

  ## Usage

      # From application config (simplest)
      client = Twilio.client()

      # Explicit credentials
      client = Twilio.client("ACxxx", "auth_token")

      # With options
      client = Twilio.client("ACxxx", "auth_token",
        region: "ie1",
        edge: "dublin",
        max_retries: 3
      )
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          auth_token: String.t(),
          username: String.t(),
          password: String.t(),
          region: String.t() | nil,
          edge: String.t() | nil,
          max_retries: non_neg_integer(),
          open_timeout: pos_integer(),
          read_timeout: pos_integer(),
          finch: atom(),
          user_agent_extensions: [String.t()]
        }

  defstruct [
    :account_sid,
    :auth_token,
    :username,
    :password,
    region: nil,
    edge: nil,
    max_retries: 0,
    open_timeout: 30_000,
    read_timeout: 30_000,
    finch: Twilio.Finch,
    user_agent_extensions: []
  ]

  @doc """
  Create a new client from application config.
  """
  @spec new() :: t()
  def new do
    account_sid =
      Twilio.Config.account_sid() || raise "Missing :account_sid in :twilio_elixir config"

    auth_token =
      Twilio.Config.auth_token() || raise "Missing :auth_token in :twilio_elixir config"

    new(account_sid, auth_token)
  end

  @doc """
  Create a new client with explicit credentials.
  """
  @spec new(String.t(), String.t()) :: t()
  def new(account_sid, auth_token) do
    new(account_sid, auth_token, [])
  end

  @doc """
  Create a new client with explicit credentials and options.

  ## Options

    * `:region` - Twilio region (e.g., `"us1"`, `"ie1"`)
    * `:edge` - Twilio edge location (e.g., `"ashburn"`, `"dublin"`)
    * `:max_retries` - Maximum retry attempts (default: `0`)
    * `:open_timeout` - Connection timeout in ms (default: `30_000`)
    * `:read_timeout` - Read timeout in ms (default: `30_000`)
    * `:finch` - Custom Finch instance name (default: `Twilio.Finch`)
    * `:account_sid` - Override account SID for subaccounts
  """
  @spec new(String.t(), String.t(), keyword()) :: t()
  def new(account_sid, auth_token, opts) do
    %__MODULE__{
      account_sid: Keyword.get(opts, :account_sid, account_sid),
      auth_token: auth_token,
      username: account_sid,
      password: auth_token,
      region: Keyword.get(opts, :region, Twilio.Config.region()),
      edge: Keyword.get(opts, :edge, Twilio.Config.edge()),
      max_retries: Keyword.get(opts, :max_retries, Twilio.Config.max_retries()),
      open_timeout: Keyword.get(opts, :open_timeout, 30_000),
      read_timeout: Keyword.get(opts, :read_timeout, 30_000),
      finch: Keyword.get(opts, :finch, Twilio.Finch),
      user_agent_extensions: Keyword.get(opts, :user_agent_extensions, [])
    }
  end

  @doc """
  Execute an API request.

  ## Options

    * `:params` - Request parameters (map)
    * `:base_url` - Base URL for the request
    * `:page_key` - Key for pagination results
    * `:content_type` - Request content type (`:form` or `:json`, default `:form`)
    * `:max_retries` - Override client max_retries for this request
    * `:return_response` - Return `{:ok, data, response}` with metadata
    * `:idempotency_token` - Custom idempotency token for POST requests
  """
  @spec request(t(), atom(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def request(%__MODULE__{} = client, method, path, opts \\ []) do
    params = Keyword.get(opts, :params, %{})
    base_url = Keyword.get(opts, :base_url, "https://api.twilio.com")
    content_type = Keyword.get(opts, :content_type, :form)
    max_retries = Keyword.get(opts, :max_retries, client.max_retries)
    return_response = Keyword.get(opts, :return_response, false)
    idempotency_token = Keyword.get(opts, :idempotency_token)

    url = resolve_url(base_url, client, method, path, params)
    headers = build_headers(client, method, content_type, max_retries, idempotency_token)
    body = encode_body(method, params, content_type)
    product = Twilio.Telemetry.product_from_base_url(base_url)

    tel = %{method: method, path: path, product: product}
    start_time = Twilio.Telemetry.start(tel)

    ctx = Map.merge(tel, %{max_retries: max_retries, idempotency_token: idempotency_token})

    try do
      result = do_request(client, url, headers, body, 0, ctx)

      case result do
        {:ok, status, resp_headers, resp_body, retries} when status in 200..299 ->
          request_id = get_header(resp_headers, "x-twilio-request-id")

          Twilio.Telemetry.stop(
            start_time,
            Map.merge(tel, %{status: status, retries: retries, request_id: request_id, error: nil})
          )

          handle_success(status, resp_headers, resp_body, return_response)

        {:ok, status, resp_headers, resp_body, retries} ->
          request_id = get_header(resp_headers, "x-twilio-request-id")
          error = Twilio.Error.from_response(status, resp_body, resp_headers)

          Twilio.Telemetry.stop(
            start_time,
            Map.merge(tel, %{
              status: status,
              retries: retries,
              request_id: request_id,
              error: error
            })
          )

          {:error, error}

        {:error, %Twilio.Error{} = error} ->
          Twilio.Telemetry.stop(
            start_time,
            Map.merge(tel, %{status: nil, retries: 0, request_id: nil, error: error})
          )

          {:error, error}
      end
    rescue
      e ->
        Twilio.Telemetry.exception(start_time, Map.merge(tel, %{kind: :error, reason: e}))
        reraise e, __STACKTRACE__
    end
  end

  # --- Private ---

  defp do_request(client, url, headers, body, attempt, ctx) do
    %{method: method, max_retries: max_retries} = ctx
    tel = Map.take(ctx, [:method, :path, :product])

    case execute_http(client, method, url, headers, body) do
      {:ok, %Finch.Response{status: 429, headers: resp_headers}}
      when attempt < max_retries ->
        wait = retry_wait_429(resp_headers, attempt)

        Twilio.Telemetry.retry(
          Map.merge(tel, %{
            attempt: attempt + 1,
            wait_ms: wait,
            status: 429,
            reason: :rate_limited
          })
        )

        Process.sleep(wait)
        do_request(client, url, headers, body, attempt + 1, ctx)

      {:ok, %Finch.Response{status: status}}
      when status in [500, 502, 503, 409] and attempt < max_retries ->
        wait = backoff_ms(attempt)

        Twilio.Telemetry.retry(
          Map.merge(tel, %{
            attempt: attempt + 1,
            wait_ms: wait,
            status: status,
            reason: :server_error
          })
        )

        Process.sleep(wait)
        do_request(client, url, headers, body, attempt + 1, ctx)

      {:ok, %Finch.Response{status: status, headers: resp_headers, body: resp_body}} ->
        {:ok, status, resp_headers, resp_body, attempt}

      {:error, %Mint.TransportError{}} when attempt < max_retries ->
        wait = backoff_ms(attempt)

        Twilio.Telemetry.retry(
          Map.merge(tel, %{
            attempt: attempt + 1,
            wait_ms: wait,
            status: nil,
            reason: :connection_error
          })
        )

        Process.sleep(wait)
        do_request(client, url, headers, body, attempt + 1, ctx)

      {:error, error} ->
        {:error, Twilio.Error.connection_error(inspect(error))}
    end
  end

  defp execute_http(client, method, url, headers, body) do
    case Twilio.Test.fetch_stub(self()) do
      {:ok, fun} ->
        finch_method = method |> to_string() |> String.upcase()
        {status, resp_headers, resp_body} = fun.(finch_method, url, headers, body)
        {:ok, %Finch.Response{status: status, headers: resp_headers, body: resp_body}}

      :error ->
        finch_method = method |> to_string() |> String.upcase()

        req =
          Finch.build(
            finch_method,
            url,
            headers,
            body,
            receive_timeout: client.read_timeout,
            pool_timeout: client.open_timeout
          )

        Finch.request(req, client.finch)
    end
  end

  defp handle_success(204, _headers, _body, _return_response), do: :ok

  defp handle_success(status, headers, body, return_response) do
    case JSON.decode(body) do
      {:ok, data} ->
        if return_response do
          response = %{
            status: status,
            headers: headers,
            request_id: get_header(headers, "x-twilio-request-id")
          }

          {:ok, data, response}
        else
          {:ok, data}
        end

      {:error, _} ->
        {:error, Twilio.Error.connection_error("Invalid JSON response")}
    end
  end

  defp resolve_url(base_url, client, method, path, params) do
    base = apply_region_edge(base_url, client)

    url = base <> path

    case method do
      :get ->
        if map_size(params) > 0 do
          url <> "?" <> URI.encode_query(flatten_params(params))
        else
          url
        end

      _ ->
        url
    end
  end

  defp apply_region_edge(base_url, %__MODULE__{region: nil, edge: nil}), do: base_url

  defp apply_region_edge(base_url, client) do
    uri = URI.parse(base_url)
    host = uri.host

    prefix =
      case {client.edge, client.region} do
        {nil, region} -> region
        {edge, nil} -> "#{edge}.us1"
        {edge, region} -> "#{edge}.#{region}"
      end

    new_host =
      case String.split(host, ".", parts: 2) do
        [subdomain, rest] -> "#{subdomain}.#{prefix}.#{rest}"
        _ -> host
      end

    URI.to_string(%{uri | host: new_host})
  end

  defp build_headers(client, method, content_type, max_retries, idempotency_token) do
    auth = Base.encode64("#{client.username}:#{client.password}")

    headers = [
      {"authorization", "Basic #{auth}"},
      {"user-agent", user_agent(client)},
      {"accept", "application/json"}
    ]

    headers =
      case {method, content_type} do
        {:get, _} -> headers
        {:delete, _} -> headers
        {_, :json} -> [{"content-type", "application/json"} | headers]
        _ -> [{"content-type", "application/x-www-form-urlencoded"} | headers]
      end

    maybe_add_idempotency_token(headers, method, max_retries, idempotency_token)
  end

  defp maybe_add_idempotency_token(headers, :post, max_retries, idempotency_token)
       when max_retries > 0 do
    token = idempotency_token || generate_idempotency_token()
    [{"i-twilio-idempotency-token", token} | headers]
  end

  defp maybe_add_idempotency_token(headers, :post, _max_retries, idempotency_token)
       when is_binary(idempotency_token) do
    [{"i-twilio-idempotency-token", idempotency_token} | headers]
  end

  defp maybe_add_idempotency_token(headers, _method, _max_retries, _token), do: headers

  defp generate_idempotency_token do
    Base.url_encode64(:crypto.strong_rand_bytes(16), padding: false)
  end

  defp encode_body(:get, _params, _content_type), do: nil
  defp encode_body(:delete, _params, _content_type), do: nil
  defp encode_body(_method, params, _content_type) when map_size(params) == 0, do: nil

  defp encode_body(_method, params, :json), do: JSON.encode!(params)

  defp encode_body(_method, params, :form) do
    params
    |> flatten_params()
    |> URI.encode_query()
  end

  defp flatten_params(params, prefix \\ nil)

  defp flatten_params(%{} = map, prefix) do
    Enum.flat_map(map, fn {key, value} ->
      new_prefix = if prefix, do: "#{prefix}[#{key}]", else: to_string(key)
      flatten_params(value, new_prefix)
    end)
  end

  defp flatten_params(values, prefix) when is_list(values) do
    Enum.flat_map(values, fn value ->
      flatten_params(value, "#{prefix}[]")
    end)
  end

  defp flatten_params(value, prefix), do: [{prefix, to_string(value)}]

  defp retry_wait_429(headers, attempt) do
    case get_header(headers, "retry-after") do
      nil ->
        backoff_ms(attempt)

      value ->
        case Integer.parse(value) do
          {seconds, _} -> seconds * 1000
          :error -> backoff_ms(attempt)
        end
    end
  end

  defp backoff_ms(attempt) do
    base = min(100 * :math.pow(2, attempt), 10_000)
    jitter = base * 0.5 * :rand.uniform()
    round(base + jitter)
  end

  defp user_agent(client) do
    base =
      "twilio-elixir/#{Twilio.version()} (#{System.otp_release()}) elixir/#{System.version()}"

    case client.user_agent_extensions do
      [] -> base
      exts -> base <> " " <> Enum.join(exts, " ")
    end
  end

  defp get_header(headers, name) do
    Enum.find_value(headers, fn {k, v} ->
      if String.downcase(k) == name, do: v
    end)
  end
end
