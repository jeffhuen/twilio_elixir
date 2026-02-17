# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V3.Service.ChannelService do
  @moduledoc """
  A Channel resource represents a chat/conversation channel with an ordered list of messages and a participant roster.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Update a specific Channel.

  Operation: `UpdateChannel` | Tags: ChatV3Channel

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `MessagingServiceSid` | string | The unique ID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) this channel belongs to. |
  | `Type` | string |  Values: `public`, `private` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V3.Service.Channel.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v3/Services/#{service_sid}/Channels/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V3.Service.Channel)}
    end
  end
end
