# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.ParticipantconversationService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Service Participant Conversations resource represents a list of Conversations that this Participant belongs to belonging to a specific conversation service.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a list of all Conversations that this Participant belongs to by identity or by address. Only one parameter should be specified.

  Operation: `ListServiceParticipantConversation` | Tags: ConversationsV1ParticipantConversation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Identity` | string | A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Address` | string | A unique string identifier for the conversation participant who's not a Conversation User. This parameter could be found in messaging_binding.address field of Participant resource. It should be url-encoded. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, chat_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{chat_service_sid}/ParticipantConversations",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "conversations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Service.Participantconversation
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of all Conversations that this Participant belongs to by identity or by address. Only one parameter should be specified. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, chat_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, chat_service_sid, Map.merge(params, page_opts), opts)
      end,
      "conversations"
    )
  end
end
