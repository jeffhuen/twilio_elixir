# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.MessagingconfigurationService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Messaging Configurations for a Service.

  Operation: `ListMessagingConfiguration` | Tags: VerifyV2MessagingConfiguration
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/MessagingConfigurations",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "messaging_configurations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Verify.V2.Service.Messagingconfiguration
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Messaging Configurations for a Service. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "messaging_configurations"
    )
  end

  @doc """
  Create a new MessagingConfiguration for a service.

  Operation: `CreateMessagingConfiguration` | Tags: VerifyV2MessagingConfiguration

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Country` | string | The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country this configuration will be applied to. If this is a global configuration, Country will take the value `all`. |
  | `MessagingServiceSid` | string | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to be used to send SMS to the country of this configuration. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Messagingconfiguration.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/MessagingConfigurations",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Messagingconfiguration)}
    end
  end

  @doc """
  Fetch a specific MessagingConfiguration.

  Operation: `FetchMessagingConfiguration` | Tags: VerifyV2MessagingConfiguration
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Messagingconfiguration.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/MessagingConfigurations/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Messagingconfiguration)}
    end
  end

  @doc """
  Update a specific MessagingConfiguration

  Operation: `UpdateMessagingConfiguration` | Tags: VerifyV2MessagingConfiguration

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `MessagingServiceSid` | string | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to be used to send SMS to the country of this configuration. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Messagingconfiguration.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/MessagingConfigurations/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Messagingconfiguration)}
    end
  end

  @doc """
  Delete a specific MessagingConfiguration.

  Operation: `DeleteMessagingConfiguration` | Tags: VerifyV2MessagingConfiguration
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{service_sid}/MessagingConfigurations/#{sid}",
      opts: opts,
      base_url: "https://verify.twilio.com"
    )
  end
end
