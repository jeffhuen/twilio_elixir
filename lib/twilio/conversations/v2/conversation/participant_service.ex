# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V2.Conversation.ParticipantService do
  @moduledoc """
  Service for Participant API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Participants in a Conversation.

  Operation: `ListParticipantByConversation` | Tags: ConversationsV2Participant

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | Maximum number of items to return |
  | `pageToken` | string | Page token for pagination |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, conversation_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Conversations/#{conversation_sid}/Participants",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "participants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V2.Conversation.Participant
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Participants in a Conversation. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, conversation_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, conversation_sid, Map.merge(params, page_opts), opts)
      end,
      "participants"
    )
  end

  @doc """
  Create a Participant.

  Operation: `CreateParticipantInConversation` | Tags: ConversationsV2Participant

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `addresses` | array |  |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `name` | string |  |
  | `profileId` | string |  |
  | `type` | string |  Values: `HUMAN_AGENT`, `CUSTOMER`, `AI_AGENT`, `AGENT`, `UNKNOWN` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V2.Conversation.Participant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, conversation_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Conversations/#{conversation_sid}/Participants",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V2.Conversation.Participant)}
    end
  end

  @doc """
  Retrieve a Participant.

  Operation: `FetchParticipant` | Tags: ConversationsV2Participant
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V2.Conversation.Participant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, conversation_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Conversations/#{conversation_sid}/Participants/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V2.Conversation.Participant)}
    end
  end
end
