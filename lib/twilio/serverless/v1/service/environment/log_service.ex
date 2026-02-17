# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.Environment.LogService do
  @moduledoc """
  A record of an event that occurred related to a function invocation.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all logs.

  Operation: `ListLog` | Tags: ServerlessV1Log

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FunctionSid` | string | The SID of the function whose invocation produced the Log resources to read. |
  | `StartDate` | string (date-time) | The date/time (in GMT, ISO 8601) after which the Log resources must have been created. Defaults to 1 day prior to current date/time. |
  | `EndDate` | string (date-time) | The date/time (in GMT, ISO 8601) before which the Log resources must have been created. Defaults to current date/time. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Logs",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "logs")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Environment.Log
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all logs. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, environment_sid, Map.merge(params, page_opts), opts)
      end,
      "logs"
    )
  end

  @doc """
  Retrieve a specific log.

  Operation: `FetchLog` | Tags: ServerlessV1Log
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.Log.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, environment_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Logs/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Environment.Log)}
    end
  end
end
