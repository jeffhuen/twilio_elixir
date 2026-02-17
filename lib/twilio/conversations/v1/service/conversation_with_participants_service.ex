# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.ConversationWithParticipantsService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  A Service Conversation resource represents an omnichannel group conversation with an ordered list of messages and a participant roster.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new conversation with the list of participants in your account's default service

  Operation: `CreateServiceConversationWithParticipants` | Tags: ConversationsV1ConversationWithParticipants

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Bindings.Email.Address` | string | The default email address that will be used when sending outbound emails in this conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Bindings.Email.Name` | string | The default name that will be used when sending outbound emails in this conversation. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. |
  | `FriendlyName` | string | The human-readable name of this conversation, limited to 256 characters. Optional. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessagingServiceSid` | string | The unique ID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) this conversation belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Participant` | array | The participant to be added to the conversation in JSON format. The JSON object attributes are as parameters in [Participant Resource](https://www.twilio.com/docs/conversations/api/conversation-participant-resource). The maximum number of participants that can be added in a single request is 10. |
  | `State` | string |  Values: `initializing`, `inactive`, `active`, `closed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Timers.Closed` | string | ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Timers.Inactive` | string | ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the resource's `sid` in the URL. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.ConversationWithParticipants.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, chat_service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{chat_service_sid}/ConversationWithParticipants",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.ConversationWithParticipants
       )}
    end
  end
end
