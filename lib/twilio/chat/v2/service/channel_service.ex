# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.Service.ChannelService do
  @moduledoc """
  Channels represent chat rooms

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListChannel` | Tags: ChatV2Channel

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | array | The visibility of the Channels to read. Can be: `public` or `private` and defaults to `public`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Channels",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "channels")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Chat.V2.Service.Channel)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "channels"
    )
  end

  @doc """


  Operation: `CreateChannel` | Tags: ChatV2Channel

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A valid JSON string that contains application-specific data. |
  | `CreatedBy` | string | The `identity` of the User that created the channel. Default is: `system`. |
  | `DateCreated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service.  Note that this should only be used in cases where a Channel is being recreated from a backup/separate source. |
  | `DateUpdated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated. The default value is `null`. Note that this parameter should only be used in cases where a Channel is being recreated from a backup/separate source  and where a Message was previously updated. |
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. It can be up to 64 characters long. |
  | `Type` | string |  Values: `public`, `private` |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the Channel resource's `sid` in the URL. This value must be 64 characters or less in length and be unique within the Service. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Channels",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel)}
    end
  end

  @doc """


  Operation: `FetchChannel` | Tags: ChatV2Channel
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{service_sid}/Channels/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel)}
    end
  end

  @doc """


  Operation: `UpdateChannel` | Tags: ChatV2Channel

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A valid JSON string that contains application-specific data. |
  | `CreatedBy` | string | The `identity` of the User that created the channel. Default is: `system`. |
  | `DateCreated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service.  Note that this should only be used in cases where a Channel is being recreated from a backup/separate source. |
  | `DateUpdated` | string (date-time) | The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 256 characters long. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the resource's `sid` in the URL. This value must be 256 characters or less in length and unique within the Service. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Channels/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel)}
    end
  end

  @doc """


  Operation: `DeleteChannel` | Tags: ChatV2Channel
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{service_sid}/Channels/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
