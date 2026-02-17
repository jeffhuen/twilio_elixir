# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.EventService do
  @moduledoc """
  API and webhook requests and responses. Contains parameters and TwiML for application control.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all events for a call.

  Operation: `ListCallEvent` | Tags: Api20100401Event
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, call_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Events.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "events")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Call.Event)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all events for a call. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, call_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, call_sid, Map.merge(params, page_opts), opts)
      end,
      "events"
    )
  end
end
