# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.FleetService do
  @moduledoc """
  Configure shared settings inherited by all Super SIMs assigned to the Fleet

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Fleets from your account.

  Operation: `ListFleet` | Tags: SupersimV1Fleet

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `NetworkAccessProfile` | string | The SID or unique name of the Network Access Profile that controls which cellular networks the Fleet's SIMs can connect to. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Fleets",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "fleets")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Supersim.V1.Fleet)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Fleets from your account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "fleets"
    )
  end

  @doc """
  Create a Fleet

  Operation: `CreateFleet` | Tags: SupersimV1Fleet

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `NetworkAccessProfile` | string | The SID or unique name of the Network Access Profile that will control which cellular networks the Fleet's SIMs can connect to. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DataEnabled` | boolean | Defines whether SIMs in the Fleet are capable of using 2G/3G/4G/LTE/CAT-M data connectivity. Defaults to `true`. |
  | `DataLimit` | integer | The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 1GB (1,000). |
  | `IpCommandsMethod` | string (http-method) | A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`. Values: `GET`, `POST` |
  | `IpCommandsUrl` | string (uri) | The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored. |
  | `SmsCommandsEnabled` | boolean | Defines whether SIMs in the Fleet are capable of sending and receiving machine-to-machine SMS via Commands. Defaults to `true`. |
  | `SmsCommandsMethod` | string (http-method) | A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`. Values: `GET`, `POST` |
  | `SmsCommandsUrl` | string (uri) | The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Fleet.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Fleets",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Fleet)}
    end
  end

  @doc """
  Fetch a Fleet instance from your account.

  Operation: `FetchFleet` | Tags: SupersimV1Fleet
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Fleet.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Fleets/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Fleet)}
    end
  end

  @doc """
  Updates the given properties of a Super SIM Fleet instance from your account.

  Operation: `UpdateFleet` | Tags: SupersimV1Fleet

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DataLimit` | integer | The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 1GB (1,000). |
  | `IpCommandsMethod` | string (http-method) | A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`. Values: `GET`, `POST` |
  | `IpCommandsUrl` | string (uri) | The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored. |
  | `NetworkAccessProfile` | string | The SID or unique name of the Network Access Profile that will control which cellular networks the Fleet's SIMs can connect to. |
  | `SmsCommandsMethod` | string (http-method) | A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`. Values: `GET`, `POST` |
  | `SmsCommandsUrl` | string (uri) | The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Fleet.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Fleets/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Fleet)}
    end
  end
end
