# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.WebhookService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Webhooks for a Service.

  Operation: `ListWebhook` | Tags: VerifyV2Webhook
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Webhooks",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "webhooks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Verify.V2.Service.Webhook
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Webhooks for a Service. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "webhooks"
    )
  end

  @doc """
  Create a new Webhook for the Service

  Operation: `CreateWebhook` | Tags: VerifyV2Webhook

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `EventTypes` | array | The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied` |
  | `FriendlyName` | string | The string that you assigned to describe the webhook. **This value should not contain PII.** |
  | `WebhookUrl` | string | The URL associated with this Webhook. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `enabled`, `disabled` |
  | `Version` | string |  Values: `v1`, `v2` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Webhook.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Webhooks",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Webhook)}
    end
  end

  @doc """
  Fetch a specific Webhook.

  Operation: `FetchWebhook` | Tags: VerifyV2Webhook
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Webhook.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{service_sid}/Webhooks/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Webhook)}
    end
  end

  @doc """


  Operation: `UpdateWebhook` | Tags: VerifyV2Webhook

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `EventTypes` | array | The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied` |
  | `FriendlyName` | string | The string that you assigned to describe the webhook. **This value should not contain PII.** |
  | `Status` | string |  Values: `enabled`, `disabled` |
  | `Version` | string |  Values: `v1`, `v2` |
  | `WebhookUrl` | string | The URL associated with this Webhook. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Webhook.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Webhooks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Webhook)}
    end
  end

  @doc """
  Delete a specific Webhook.

  Operation: `DeleteWebhook` | Tags: VerifyV2Webhook
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{service_sid}/Webhooks/#{sid}",
      opts: opts,
      base_url: "https://verify.twilio.com"
    )
  end
end
