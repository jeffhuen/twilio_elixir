# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.BindingService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  A Binding resource represents a push notification binding and its configuration, for delivering conversation events to mobile or web endpoints.

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all push notification bindings in the conversation service

  Operation: `ListServiceBinding` | Tags: ConversationsV1Binding

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BindingType` | array | The push technology used by the Binding resources to read.  Can be: `apn`, `gcm`, `fcm`, or `twilsock`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Identity` | array | The identity of a [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource) this binding belongs to. See [access tokens](https://www.twilio.com/docs/conversations/create-tokens) for more details. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, chat_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{chat_service_sid}/Bindings",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "bindings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Service.Binding
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all push notification bindings in the conversation service (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, chat_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, chat_service_sid, Map.merge(params, page_opts), opts)
      end,
      "bindings"
    )
  end

  @doc """
  Fetch a push notification binding from the conversation service

  Operation: `FetchServiceBinding` | Tags: ConversationsV1Binding
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Binding.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, chat_service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{chat_service_sid}/Bindings/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.Binding)}
    end
  end

  @doc """
  Remove a push notification binding from the conversation service

  Operation: `DeleteServiceBinding` | Tags: ConversationsV1Binding
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, chat_service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{chat_service_sid}/Bindings/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
