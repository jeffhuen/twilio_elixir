# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.Conversation.Message.ReceiptService do
  @moduledoc """
  A Service Message Receipt resource represents a delivery/read receipt of a message in a conversation.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all delivery and read receipts of the conversation message

  Operation: `ListServiceConversationMessageReceipt` | Tags: ConversationsV1DeliveryReceipt
  """
  @spec list(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, chat_service_sid, conversation_sid, message_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages/#{message_sid}/Receipts",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "delivery_receipts")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Service.Conversation.Message.Receipt
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all delivery and read receipts of the conversation message (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, chat_service_sid, conversation_sid, message_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(
          client,
          chat_service_sid,
          conversation_sid,
          message_sid,
          Map.merge(params, page_opts),
          opts
        )
      end,
      "delivery_receipts"
    )
  end

  @doc """
  Fetch the delivery and read receipts of the conversation message

  Operation: `FetchServiceConversationMessageReceipt` | Tags: ConversationsV1DeliveryReceipt
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.Message.Receipt.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, chat_service_sid, conversation_sid, message_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages/#{message_sid}/Receipts/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.Conversation.Message.Receipt
       )}
    end
  end
end
