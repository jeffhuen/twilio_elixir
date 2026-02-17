# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Bulkexports.V1.Export.JobService do
  @moduledoc """
  Service for Job API operations.

  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListExportCustomJob` | Tags: BulkexportsV1ExportCustomJob
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, resource_type, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Exports/#{resource_type}/Jobs",
           params: params,
           opts: opts,
           base_url: "https://bulkexports.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "jobs")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Bulkexports.V1.Export.Job
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, resource_type, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, resource_type, Map.merge(params, page_opts), opts)
      end,
      "jobs"
    )
  end

  @doc """


  Operation: `CreateExportCustomJob` | Tags: BulkexportsV1ExportCustomJob

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndDay` | string | The end day for the custom export specified as a string in the format of yyyy-mm-dd. End day is inclusive and must be 2 days earlier than the current UTC day. |
  | `FriendlyName` | string | The friendly name specified when creating the job |
  | `StartDay` | string | The start day for the custom export specified as a string in the format of yyyy-mm-dd |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Email` | string | The optional email to send the completion notification to. You can set both webhook, and email, or one or the other. If you set neither, the job will run but you will have to query to determine your job's status. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WebhookMethod` | string | This is the method used to call the webhook on completion of the job. If this is supplied, `WebhookUrl` must also be supplied. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WebhookUrl` | string | The optional webhook url called on completion of the job. If this is supplied, `WebhookMethod` must also be supplied. If you set neither webhook nor email, you will have to check your job's status manually. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Bulkexports.V1.Export.Job.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, resource_type, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Exports/#{resource_type}/Jobs",
             params: params,
             opts: opts,
             base_url: "https://bulkexports.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Bulkexports.V1.Export.Job)}
    end
  end
end
