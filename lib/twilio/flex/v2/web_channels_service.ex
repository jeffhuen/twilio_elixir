# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V2.WebChannelsService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `CreateWebChannel` | Tags: FlexV2WebChannels

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AddressSid` | string | The SID of the Conversations Address. See [Address Configuration Resource](https://www.twilio.com/docs/conversations/api/address-configuration-resource) for configuration details. When a conversation is created on the Flex backend, the callback URL will be set to the corresponding Studio Flow SID or webhook URL in your address configuration. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChatFriendlyName` | string | The Conversation's friendly name. See the [Conversation resource](https://www.twilio.com/docs/conversations/api/conversation-resource) for an example. |
  | `CustomerFriendlyName` | string | The Conversation participant's friendly name. See the [Conversation Participant Resource](https://www.twilio.com/docs/conversations/api/conversation-participant-resource) for an example. |
  | `Identity` | string | The Identity of the guest user. See the [Conversation User Resource](https://www.twilio.com/docs/conversations/api/user-resource) for an example. |
  | `PreEngagementData` | string | The pre-engagement data. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V2.WebChannels.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/WebChats",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V2.WebChannels)}
    end
  end
end
