# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.IpcommandService do
  @moduledoc """
  Machine-to-machine IP Commands sent to/from Super SIMs

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of IP Commands from your account.

  Operation: `ListIpCommand` | Tags: SupersimV1IpCommand

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Sim` | string | The SID or unique name of the Sim resource that IP Command was sent to or from. |
  | `SimIccid` | string | The ICCID of the Sim resource that IP Command was sent to or from. |
  | `Status` | string | The status of the IP Command. Can be: `queued`, `sent`, `received` or `failed`. See the [IP Command Status Values](https://www.twilio.com/docs/iot/supersim/api/ipcommand-resource#status-values) for a description of each. |
  | `Direction` | string | The direction of the IP Command. Can be `to_sim` or `from_sim`. The value of `to_sim` is synonymous with the term `mobile terminated`, and `from_sim` is synonymous with the term `mobile originated`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/IpCommands",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "ip_commands")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Supersim.V1.Ipcommand)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of IP Commands from your account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "ip_commands"
    )
  end

  @doc """
  Send an IP Command to a Super SIM.

  Operation: `CreateIpCommand` | Tags: SupersimV1IpCommand

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DevicePort` | integer | The device port to which the IP Command will be sent. |
  | `Payload` | string | The data that will be sent to the device. The payload cannot exceed 1300 bytes. If the PayloadType is set to text, the payload is encoded in UTF-8. If PayloadType is set to binary, the payload is encoded in Base64. |
  | `Sim` | string | The `sid` or `unique_name` of the [Super SIM](https://www.twilio.com/docs/iot/supersim/api/sim-resource) to send the IP Command to. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CallbackMethod` | string (http-method) | The HTTP method we should use to call `callback_url`. Can be `GET` or `POST`, and the default is `POST`. Values: `GET`, `POST` |
  | `CallbackUrl` | string (uri) | The URL we should call using the `callback_method` after we have sent the IP Command. |
  | `PayloadType` | string |  Values: `text`, `binary` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Ipcommand.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/IpCommands",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Ipcommand)}
    end
  end

  @doc """
  Fetch IP Command instance from your account.

  Operation: `FetchIpCommand` | Tags: SupersimV1IpCommand
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Ipcommand.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/IpCommands/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Ipcommand)}
    end
  end
end
