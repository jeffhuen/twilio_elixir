# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.Porting.Configuration.WebhookService do
  @moduledoc """


  Operations: `list`, `create`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Allows to fetch the webhook configuration

  Operation: `FetchPortingWebhookConfigurationFetch` | Tags: NumbersV1PortingWebhookConfigurationFetch
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Porting/Configuration/Webhook",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "webhook")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V1.Porting.Configuration.Webhook
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Allows to fetch the webhook configuration (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "webhook"
    )
  end

  @doc """
  Create a Webhook Configuration

  Operation: `CreatePortingWebhookConfiguration` | Tags: NumbersV1PortingWebhookConfiguration
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.Porting.Configuration.Webhook.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Porting/Configuration/Webhook",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.Porting.Configuration.Webhook)}
    end
  end

  @doc """
  Allows the client to delete a webhook configuration.

  Operation: `DeletePortingWebhookConfigurationDelete` | Tags: NumbersV1PortingWebhookConfigurationDelete
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Porting/Configuration/Webhook/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
