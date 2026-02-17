# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.Service.Channel.MessageService do
  @moduledoc """
  Individual chat messages

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListMessage` | Tags: ChatV2Message

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Order` | string | The sort order of the returned messages. Can be: `asc` (ascending) or `desc` (descending) with `asc` as the default. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "messages")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Chat.V2.Service.Channel.Message
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, channel_sid, Map.merge(params, page_opts), opts)
      end,
      "messages"
    )
  end

  @doc """


  Operation: `CreateMessage` | Tags: ChatV2Message

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A valid JSON string that contains application-specific data. |
  | `Body` | string | The message to send to the channel. Can be an empty string or `null`, which sets the value as an empty string. You can send structured data in the body by serializing it as a string. |
  | `DateCreated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service. This parameter should only be used when a Chat's history is being recreated from a backup/separate source. |
  | `DateUpdated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated. |
  | `From` | string | The [Identity](https://www.twilio.com/docs/chat/identity) of the new message's author. The default value is `system`. |
  | `LastUpdatedBy` | string | The [Identity](https://www.twilio.com/docs/chat/identity) of the User who last updated the Message, if applicable. |
  | `MediaSid` | string | The SID of the [Media](https://www.twilio.com/docs/chat/rest/media) to attach to the new Message. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.Message.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel.Message)}
    end
  end

  @doc """


  Operation: `FetchMessage` | Tags: ChatV2Message
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.Message.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel.Message)}
    end
  end

  @doc """


  Operation: `UpdateMessage` | Tags: ChatV2Message

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A valid JSON string that contains application-specific data. |
  | `Body` | string | The message to send to the channel. Can be an empty string or `null`, which sets the value as an empty string. You can send structured data in the body by serializing it as a string. |
  | `DateCreated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service. This parameter should only be used when a Chat's history is being recreated from a backup/separate source. |
  | `DateUpdated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated. |
  | `From` | string | The [Identity](https://www.twilio.com/docs/chat/identity) of the message's author. |
  | `LastUpdatedBy` | string | The [Identity](https://www.twilio.com/docs/chat/identity) of the User who last updated the Message, if applicable. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.Message.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel.Message)}
    end
  end

  @doc """


  Operation: `DeleteMessage` | Tags: ChatV2Message
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, channel_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
