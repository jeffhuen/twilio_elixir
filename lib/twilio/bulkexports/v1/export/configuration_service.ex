# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Bulkexports.V1.Export.ConfigurationService do
  @moduledoc """


  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a specific Export Configuration.

  Operation: `FetchExportConfiguration` | Tags: BulkexportsV1ExportConfiguration
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Bulkexports.V1.Export.Configuration.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, resource_type, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Exports/#{resource_type}/Configuration",
             opts: opts,
             base_url: "https://bulkexports.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Bulkexports.V1.Export.Configuration)}
    end
  end

  @doc """
  Update a specific Export Configuration.

  Operation: `UpdateExportConfiguration` | Tags: BulkexportsV1ExportConfiguration

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | If true, Twilio will automatically generate every day's file when the day is over. |
  | `WebhookMethod` | string | Sets whether Twilio should call a webhook URL when the automatic generation is complete, using GET or POST. The actual destination is set in the webhook_url |
  | `WebhookUrl` | string (uri) | Stores the URL destination for the method specified in webhook_method. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Bulkexports.V1.Export.Configuration.t()}
          | {:error, Twilio.Error.t()}
  def update(client, resource_type, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Exports/#{resource_type}/Configuration",
             params: params,
             opts: opts,
             base_url: "https://bulkexports.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Bulkexports.V1.Export.Configuration)}
    end
  end
end
