# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.NotificationService do
  @moduledoc """
  Error notifications for calls

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListCallNotification` | Tags: Api20100401CallNotification

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Log` | integer | Only read notifications of the specified log level. Can be:  `0` to read only ERROR notifications or `1` to read only WARNING notifications. By default, all notifications are read. |
  | `MessageDate` | string (date) | Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date. |
  | `MessageDate<` | string (date) | Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date. |
  | `MessageDate>` | string (date) | Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, call_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Notifications.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "notifications")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Call.Notification
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, call_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, call_sid, Map.merge(params, page_opts), opts)
      end,
      "notifications"
    )
  end

  @doc """


  Operation: `FetchCallNotification` | Tags: Api20100401CallNotification
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Notification.t()} | {:error, Twilio.Error.t()}
  def fetch(client, call_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Notifications/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Notification)}
    end
  end
end
