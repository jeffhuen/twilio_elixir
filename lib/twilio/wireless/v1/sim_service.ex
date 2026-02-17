# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Wireless.V1.SimService do
  @moduledoc """
  A resource representing a Programmable Wireless SIM

  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Sim resources on your Account.

  Operation: `ListSim` | Tags: WirelessV1Sim

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | Only return Sim resources with this status. |
  | `Iccid` | string | Only return Sim resources with this ICCID. This will return a list with a maximum size of 1. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RatePlan` | string | The SID or unique name of a [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource). Only return Sim resources assigned to this RatePlan resource. |
  | `EId` | string | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SimRegistrationCode` | string | Only return Sim resources with this registration code. This will return a list with a maximum size of 1. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sims",
           params: params,
           opts: opts,
           base_url: "https://wireless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "sims")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Wireless.V1.Sim)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Sim resources on your Account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "sims"
    )
  end

  @doc """
  Fetch a Sim resource on your Account.

  Operation: `FetchSim` | Tags: WirelessV1Sim
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.Sim.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Sims/#{sid}",
             opts: opts,
             base_url: "https://wireless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.Sim)}
    end
  end

  @doc """
  Updates the given properties of a Sim resource on your Account.

  Operation: `UpdateSim` | Tags: WirelessV1Sim

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AccountSid` | string | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the Sim resource should belong. The Account SID can only be that of the requesting Account or that of a [Subaccount](https://www.twilio.com/docs/iam/api/subaccounts) of the requesting Account. Only valid when the Sim resource's status is `new`. For more information, see the [Move SIMs between Subaccounts documentation](https://www.twilio.com/docs/iot/wireless/api/sim-resource#move-sims-between-subaccounts). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackMethod` | string (http-method) | The HTTP method we should use to call `callback_url`. Can be: `POST` or `GET`. The default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackUrl` | string (uri) | The URL we should call using the `callback_url` when the SIM has finished updating. When the SIM transitions from `new` to `ready` or from any status to `deactivated`, we call this URL when the status changes to an intermediate status (`ready` or `deactivated`) and again when the status changes to its final status (`active` or `canceled`). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CommandsCallbackMethod` | string (http-method) | The HTTP method we should use to call `commands_callback_url`. Can be: `POST` or `GET`. The default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CommandsCallbackUrl` | string (uri) | The URL we should call using the `commands_callback_method` when the SIM sends a [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource). Your server should respond with an HTTP status code in the 200 range; any response body is ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Sim resource. It does not need to be unique. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RatePlan` | string | The SID or unique name of the [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource) to which the Sim resource should be assigned. |
  | `ResetStatus` | string |  Values: `resetting` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackMethod` | string (http-method) | The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`. Default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackUrl` | string (uri) | The URL we should call using the `sms_fallback_method` when an error occurs while retrieving or executing the TwiML requested from `sms_url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsMethod` | string (http-method) | The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`. Default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsUrl` | string (uri) | The URL we should call using the `sms_method` when the SIM-connected device sends an SMS message that is not a [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string |  Values: `new`, `ready`, `active`, `suspended`, `deactivated`, `canceled`, `scheduled`, `updating` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the `sid` in the URL path to address the resource. |
  | `VoiceFallbackMethod` | string (http-method) | Deprecated. Values: `GET`, `POST` |
  | `VoiceFallbackUrl` | string (uri) | Deprecated. |
  | `VoiceMethod` | string (http-method) | Deprecated. Values: `GET`, `POST` |
  | `VoiceUrl` | string (uri) | Deprecated. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.Sim.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sims/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://wireless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.Sim)}
    end
  end

  @doc """
  Delete a Sim resource on your Account.

  Operation: `DeleteSim` | Tags: WirelessV1Sim
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Sims/#{sid}",
      opts: opts,
      base_url: "https://wireless.twilio.com"
    )
  end
end
