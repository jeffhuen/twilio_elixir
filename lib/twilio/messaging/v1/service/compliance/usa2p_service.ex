# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Service.Compliance.Usa2pService do
  @moduledoc """
  A service for (fetch/create/delete) A2P Campaign for a Messaging Service

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUsAppToPerson` | Tags: MessagingV1UsAppToPerson
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{messaging_service_sid}/Compliance/Usa2p",
           params: params,
           opts: opts,
           base_url: "https://messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "compliance")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, messaging_service_sid, Map.merge(params, page_opts), opts)
      end,
      "compliance"
    )
  end

  @doc """


  Operation: `CreateUsAppToPerson` | Tags: MessagingV1UsAppToPerson

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BrandRegistrationSid` | string | A2P Brand Registration SID |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Description` | string | A short description of what this SMS campaign does. Min length: 40 characters. Max length: 4096 characters. |
  | `HasEmbeddedLinks` | boolean | Indicates that this SMS campaign will send messages that contain links. |
  | `HasEmbeddedPhone` | boolean | Indicates that this SMS campaign will send messages that contain phone numbers. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessageFlow` | string | Required for all Campaigns. Details around how a consumer opts-in to their campaign, therefore giving consent to receive their messages. If multiple opt-in methods can be used for the same campaign, they must all be listed. 40 character minimum. 2048 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessageSamples` | array | An array of sample message strings, min two and max five. Min length for each sample: 20 chars. Max length for each sample: 1024 chars. |
  | `UsAppToPersonUsecase` | string | A2P Campaign Use Case. Examples: [ 2FA, EMERGENCY, MARKETING..] |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AgeGated` | boolean | A boolean that specifies whether campaign is age gated or not. |
  | `DirectLending` | boolean | A boolean that specifies whether campaign allows direct lending or not. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HelpKeywords` | array | End users should be able to text in a keyword to receive help. Those keywords must be provided as part of the campaign registration request. This field is required if managing help keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). Values must be alphanumeric. 255 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HelpMessage` | string | When customers receive the help keywords from their end users, Twilio customers are expected to send back an auto-generated response; this may include the brand name and additional support contact information. This field is required if managing help keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). 20 character minimum. 320 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInKeywords` | array | If end users can text in a keyword to start receiving messages from this campaign, those keywords must be provided. This field is required if end users can text in a keyword to start receiving messages from this campaign. Values must be alphanumeric. 255 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInMessage` | string | If end users can text in a keyword to start receiving messages from this campaign, the auto-reply messages sent to the end users must be provided. The opt-in response should include the Brand name, confirmation of opt-in enrollment to a recurring message campaign, how to get help, and clear description of how to opt-out. This field is required if end users can text in a keyword to start receiving messages from this campaign. 20 character minimum. 320 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptOutKeywords` | array | End users should be able to text in a keyword to stop receiving messages from this campaign. Those keywords must be provided. This field is required if managing opt out keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). Values must be alphanumeric. 255 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptOutMessage` | string | Upon receiving the opt-out keywords from the end users, Twilio customers are expected to send back an auto-generated response, which must provide acknowledgment of the opt-out request and confirmation that no further messages will be sent. It is also recommended that these opt-out messages include the brand name. This field is required if managing opt out keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). 20 character minimum. 320 character maximum. |
  | `SubscriberOptIn` | boolean | A boolean that specifies whether campaign has Subscriber Optin or not. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{messaging_service_sid}/Compliance/Usa2p",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p)}
    end
  end

  @doc """


  Operation: `FetchUsAppToPerson` | Tags: MessagingV1UsAppToPerson
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, messaging_service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{messaging_service_sid}/Compliance/Usa2p/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p)}
    end
  end

  @doc """


  Operation: `UpdateUsAppToPerson` | Tags: MessagingV1UsAppToPerson

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AgeGated` | boolean | A boolean that specifies whether campaign requires age gate for federally legal content. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Description` | string | A short description of what this SMS campaign does. Min length: 40 characters. Max length: 4096 characters. |
  | `DirectLending` | boolean | A boolean that specifies whether campaign allows direct lending or not. |
  | `HasEmbeddedLinks` | boolean | Indicates that this SMS campaign will send messages that contain links. |
  | `HasEmbeddedPhone` | boolean | Indicates that this SMS campaign will send messages that contain phone numbers. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessageFlow` | string | Required for all Campaigns. Details around how a consumer opts-in to their campaign, therefore giving consent to receive their messages. If multiple opt-in methods can be used for the same campaign, they must all be listed. 40 character minimum. 2048 character maximum. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessageSamples` | array | An array of sample message strings, min two and max five. Min length for each sample: 20 chars. Max length for each sample: 1024 chars. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, messaging_service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{messaging_service_sid}/Compliance/Usa2p/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p)}
    end
  end

  @doc """


  Operation: `DeleteUsAppToPerson` | Tags: MessagingV1UsAppToPerson
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, messaging_service_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{messaging_service_sid}/Compliance/Usa2p/#{sid}",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
