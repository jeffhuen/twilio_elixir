# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Wireless.V1.CommandService do
  @moduledoc """
  Machine-to-machine commands sent to/from devices

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Commands from your account.

  Operation: `ListCommand` | Tags: WirelessV1Command

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Sim` | string | The `sid` or `unique_name` of the [Sim resources](https://www.twilio.com/docs/iot/wireless/api/sim-resource) to read. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | The status of the resources to read. Can be: `queued`, `sent`, `delivered`, `received`, or `failed`. |
  | `Direction` | string | Only return Commands with this direction value. |
  | `Transport` | string | Only return Commands with this transport value. Can be: `sms` or `ip`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Commands",
           params: params,
           opts: opts,
           base_url: "https://wireless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "commands")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Wireless.V1.Command)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Commands from your account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "commands"
    )
  end

  @doc """
  Send a Command to a Sim.

  Operation: `CreateCommand` | Tags: WirelessV1Command

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Command` | string | The message body of the Command. Can be plain text in text mode or a Base64 encoded byte string in binary mode. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackMethod` | string (http-method) | The HTTP method we use to call `callback_url`. Can be: `POST` or `GET`, and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackUrl` | string (uri) | The URL we call using the `callback_url` when the Command has finished sending, whether the command was delivered or it failed. |
  | `CommandMode` | string |  Values: `text`, `binary` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DeliveryReceiptRequested` | boolean | Whether to request delivery receipt from the recipient. For Commands that request delivery receipt, the Command state transitions to 'delivered' once the server has received a delivery receipt from the device. The default value is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncludeSid` | string | Whether to include the SID of the command in the message body. Can be: `none`, `start`, or `end`, and the default behavior is `none`. When sending a Command to a SIM in text mode, we can automatically include the SID of the Command in the message body, which could be used to ensure that the device does not process the same Command more than once.  A value of `start` will prepend the message with the Command SID, and `end` will append it to the end, separating the Command SID from the message body with a space. The length of the Command SID is included in the 160 character limit so the SMS body must be 128 characters or less before the Command SID is included. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Sim` | string | The `sid` or `unique_name` of the [SIM](https://www.twilio.com/docs/iot/wireless/api/sim-resource) to send the Command to. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.Command.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Commands",
             params: params,
             opts: opts,
             base_url: "https://wireless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.Command)}
    end
  end

  @doc """
  Fetch a Command instance from your account.

  Operation: `FetchCommand` | Tags: WirelessV1Command
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.Command.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Commands/#{sid}",
             opts: opts,
             base_url: "https://wireless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.Command)}
    end
  end

  @doc """
  Delete a Command instance from your account.

  Operation: `DeleteCommand` | Tags: WirelessV1Command
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Commands/#{sid}",
      opts: opts,
      base_url: "https://wireless.twilio.com"
    )
  end
end
