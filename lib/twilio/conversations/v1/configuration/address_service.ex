# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Configuration.AddressService do
  @moduledoc """
  Address Configuration resource manages the configurations related to a unique address within Conversations

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of address configurations for an account

  Operation: `ListConfigurationAddress` | Tags: ConversationsV1AddressConfiguration

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | string | Filter the address configurations by its type. This value can be one of: `whatsapp`, `sms`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Configuration/Addresses",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "address_configurations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Configuration.Address
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of address configurations for an account (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "address_configurations"
    )
  end

  @doc """
  Create a new address configuration

  Operation: `CreateConfigurationAddress` | Tags: ConversationsV1AddressConfiguration

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Address` | string | The unique address to be configured. The address can be a whatsapp address or phone number |
  | `Type` | string |  Values: `sms`, `whatsapp`, `messenger`, `gbm`, `email`, `rcs`, `apple`, `chat` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AddressCountry` | string | An ISO 3166-1 alpha-2n country code which the address belongs to. This is currently only applicable to short code addresses. |
  | `AutoCreation.ConversationServiceSid` | string | Conversation Service for the auto-created conversation. If not set, the conversation is created in the default service. |
  | `AutoCreation.Enabled` | boolean | Enable/Disable auto-creating conversations for messages to this address |
  | `AutoCreation.StudioFlowSid` | string | For type `studio`, the studio flow SID where the webhook should be sent to. |
  | `AutoCreation.StudioRetryCount` | integer | For type `studio`, number of times to retry the webhook request |
  | `AutoCreation.Type` | string |  Values: `webhook`, `studio`, `default` |
  | `AutoCreation.WebhookFilters` | array | The list of events, firing webhook event for this Conversation. Values can be any of the following: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onConversationUpdated`, `onConversationStateUpdated`, `onConversationRemoved`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`, `onDeliveryUpdated` |
  | `AutoCreation.WebhookMethod` | string |  Values: `get`, `post` |
  | `AutoCreation.WebhookUrl` | string | For type `webhook`, the url for the webhook request. |
  | `FriendlyName` | string | The human-readable name of this configuration, limited to 256 characters. Optional. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.Address.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Configuration/Addresses",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration.Address)}
    end
  end

  @doc """
  Fetch an address configuration 

  Operation: `FetchConfigurationAddress` | Tags: ConversationsV1AddressConfiguration
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.Address.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Configuration/Addresses/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration.Address)}
    end
  end

  @doc """
  Update an existing address configuration

  Operation: `UpdateConfigurationAddress` | Tags: ConversationsV1AddressConfiguration

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AutoCreation.ConversationServiceSid` | string | Conversation Service for the auto-created conversation. If not set, the conversation is created in the default service. |
  | `AutoCreation.Enabled` | boolean | Enable/Disable auto-creating conversations for messages to this address |
  | `AutoCreation.StudioFlowSid` | string | For type `studio`, the studio flow SID where the webhook should be sent to. |
  | `AutoCreation.StudioRetryCount` | integer | For type `studio`, number of times to retry the webhook request |
  | `AutoCreation.Type` | string |  Values: `webhook`, `studio`, `default` |
  | `AutoCreation.WebhookFilters` | array | The list of events, firing webhook event for this Conversation. Values can be any of the following: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onConversationUpdated`, `onConversationStateUpdated`, `onConversationRemoved`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`, `onDeliveryUpdated` |
  | `AutoCreation.WebhookMethod` | string |  Values: `get`, `post` |
  | `AutoCreation.WebhookUrl` | string | For type `webhook`, the url for the webhook request. |
  | `FriendlyName` | string | The human-readable name of this configuration, limited to 256 characters. Optional. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.Address.t()}
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Configuration/Addresses/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration.Address)}
    end
  end

  @doc """
  Remove an existing address configuration

  Operation: `DeleteConfigurationAddress` | Tags: ConversationsV1AddressConfiguration
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Configuration/Addresses/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
