# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.ConfigurationService do
  @moduledoc """
  The Configuration resource manages a set of account-level settings applicable to the Conversations API.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch the global configuration of conversations on your account

  Operation: `FetchConfiguration` | Tags: ConversationsV1Configuration
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Configuration",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration)}
    end
  end

  @doc """
  Update the global configuration of conversations on your account

  Operation: `UpdateConfiguration` | Tags: ConversationsV1Configuration

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultChatServiceSid` | string | The SID of the default [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) to use when creating a conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultClosedTimer` | string | Default ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultInactiveTimer` | string | Default ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultMessagingServiceSid` | string | The SID of the default [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to use when creating a conversation. |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Configuration",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration)}
    end
  end
end
