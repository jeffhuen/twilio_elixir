# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trunking.V1.TrunkService do
  @moduledoc """
  Represents a SIP trunk

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListTrunk` | Tags: TrunkingV1Trunk
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Trunks",
           params: params,
           opts: opts,
           base_url: "https://trunking.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "trunks")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Trunking.V1.Trunk)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "trunks"
    )
  end

  @doc """


  Operation: `CreateTrunk` | Tags: TrunkingV1Trunk

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CnamLookupEnabled` | boolean | Whether Caller ID Name (CNAM) lookup should be enabled for the trunk. If enabled, all inbound calls to the SIP Trunk from the United States and Canada automatically perform a CNAM Lookup and display Caller ID data on your phone. See [CNAM Lookups](https://www.twilio.com/docs/sip-trunking#CNAM) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DisasterRecoveryMethod` | string (http-method) | The HTTP method we should use to call the `disaster_recovery_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DisasterRecoveryUrl` | string (uri) | The URL we should call using the `disaster_recovery_method` if an error occurs while sending SIP traffic towards the configured Origination URL. We retrieve TwiML from the URL and execute the instructions like any other normal TwiML call. See [Disaster Recovery](https://www.twilio.com/docs/sip-trunking#disaster-recovery) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DomainName` | string | The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and `-` and must end with `pstn.twilio.com`. See [Termination Settings](https://www.twilio.com/docs/sip-trunking#termination) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Secure` | boolean | Whether Secure Trunking is enabled for the trunk. If enabled, all calls going through the trunk will be secure using SRTP for media and TLS for signaling. If disabled, then RTP will be used for media. See [Secure Trunking](https://www.twilio.com/docs/sip-trunking#securetrunking) for more information. |
  | `TransferCallerId` | string |  Values: `from-transferee`, `from-transferor` |
  | `TransferMode` | string |  Values: `disable-all`, `enable-all`, `sip-only` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk)}
    end
  end

  @doc """


  Operation: `FetchTrunk` | Tags: TrunkingV1Trunk
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Trunks/#{sid}",
             opts: opts,
             base_url: "https://trunking.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk)}
    end
  end

  @doc """


  Operation: `UpdateTrunk` | Tags: TrunkingV1Trunk

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CnamLookupEnabled` | boolean | Whether Caller ID Name (CNAM) lookup should be enabled for the trunk. If enabled, all inbound calls to the SIP Trunk from the United States and Canada automatically perform a CNAM Lookup and display Caller ID data on your phone. See [CNAM Lookups](https://www.twilio.com/docs/sip-trunking#CNAM) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DisasterRecoveryMethod` | string (http-method) | The HTTP method we should use to call the `disaster_recovery_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DisasterRecoveryUrl` | string (uri) | The URL we should call using the `disaster_recovery_method` if an error occurs while sending SIP traffic towards the configured Origination URL. We retrieve TwiML from the URL and execute the instructions like any other normal TwiML call. See [Disaster Recovery](https://www.twilio.com/docs/sip-trunking#disaster-recovery) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DomainName` | string | The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and `-` and must end with `pstn.twilio.com`. See [Termination Settings](https://www.twilio.com/docs/sip-trunking#termination) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Secure` | boolean | Whether Secure Trunking is enabled for the trunk. If enabled, all calls going through the trunk will be secure using SRTP for media and TLS for signaling. If disabled, then RTP will be used for media. See [Secure Trunking](https://www.twilio.com/docs/sip-trunking#securetrunking) for more information. |
  | `TransferCallerId` | string |  Values: `from-transferee`, `from-transferor` |
  | `TransferMode` | string |  Values: `disable-all`, `enable-all`, `sip-only` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk)}
    end
  end

  @doc """


  Operation: `DeleteTrunk` | Tags: TrunkingV1Trunk
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Trunks/#{sid}",
      opts: opts,
      base_url: "https://trunking.twilio.com"
    )
  end
end
