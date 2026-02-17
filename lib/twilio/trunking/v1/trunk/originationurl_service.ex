# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trunking.V1.Trunk.OriginationurlService do
  @moduledoc """
  Network element entry points into your communications infrastructure

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListOriginationUrl` | Tags: TrunkingV1OriginationUrl
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, trunk_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/OriginationUrls",
           params: params,
           opts: opts,
           base_url: "https://trunking.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "origination_urls")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trunking.V1.Trunk.Originationurl
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, trunk_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, trunk_sid, Map.merge(params, page_opts), opts)
      end,
      "origination_urls"
    )
  end

  @doc """


  Operation: `CreateOriginationUrl` | Tags: TrunkingV1OriginationUrl

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | Whether the URL is enabled. The default is `true`. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `Priority` | integer | The relative importance of the URI. Can be an integer from 0 to 65535, inclusive, and the default is 10. The lowest number represents the most important URI. |
  | `SipUrl` | string (uri) | The SIP address you want Twilio to route your Origination calls to. This must be a `sip:` schema. |
  | `Weight` | integer | The value that determines the relative share of the load the URI should receive compared to other URIs with the same priority. Can be an integer from 1 to 65535, inclusive, and the default is 10. URLs with higher values receive more load than those with lower ones with the same priority. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Originationurl.t()}
          | {:error, Twilio.Error.t()}
  def create(client, trunk_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{trunk_sid}/OriginationUrls",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Originationurl)}
    end
  end

  @doc """


  Operation: `FetchOriginationUrl` | Tags: TrunkingV1OriginationUrl
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Originationurl.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, trunk_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/OriginationUrls/#{sid}",
             opts: opts,
             base_url: "https://trunking.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Originationurl)}
    end
  end

  @doc """


  Operation: `UpdateOriginationUrl` | Tags: TrunkingV1OriginationUrl

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | Whether the URL is enabled. The default is `true`. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `Priority` | integer | The relative importance of the URI. Can be an integer from 0 to 65535, inclusive, and the default is 10. The lowest number represents the most important URI. |
  | `SipUrl` | string (uri) | The SIP address you want Twilio to route your Origination calls to. This must be a `sip:` schema. `sips` is NOT supported. |
  | `Weight` | integer | The value that determines the relative share of the load the URI should receive compared to other URIs with the same priority. Can be an integer from 1 to 65535, inclusive, and the default is 10. URLs with higher values receive more load than those with lower ones with the same priority. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Originationurl.t()}
          | {:error, Twilio.Error.t()}
  def update(client, trunk_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{trunk_sid}/OriginationUrls/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Originationurl)}
    end
  end

  @doc """


  Operation: `DeleteOriginationUrl` | Tags: TrunkingV1OriginationUrl
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, trunk_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Trunks/#{trunk_sid}/OriginationUrls/#{sid}",
      opts: opts,
      base_url: "https://trunking.twilio.com"
    )
  end
end
