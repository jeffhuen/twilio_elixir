# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V2.Conversation.ActionService do
  @moduledoc """
  Service for Action API operations.

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  Creates an Action within a Conversation. Currently supports SEND_MESSAGE,
  which sends a message to recipients via the configured channel.

  Returns 202 Accepted with the Action in PENDING status. Poll
  `GET /v2/Conversations/{ConversationId}/Actions/{ActionId}` to check completion.


  Operation: `CreateConversationAction` | Tags: ConversationsV2Action
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, conversation_id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v2/Conversations/#{conversation_id}/Actions",
      params: params,
      opts: opts,
      base_url: "https://conversations.twilio.com",
      content_type: :json
    )
  end
end
