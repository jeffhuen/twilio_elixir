# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.RecordingService do
  @moduledoc """
  Recordings of phone calls

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of recordings belonging to the account used to make the request

  Operation: `ListRecording` | Tags: Api20100401Recording

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DateCreated` | string (date-time) | Only include recordings that were created on this date. Specify a date as `YYYY-MM-DD` in GMT, for example: `2009-07-06`, to read recordings that were created on this date. You can also specify an inequality, such as `DateCreated<=YYYY-MM-DD`, to read recordings that were created on or before midnight of this date, and `DateCreated>=YYYY-MM-DD` to read recordings that were created on or after midnight of this date. |
  | `DateCreated<` | string (date-time) | Only include recordings that were created on this date. Specify a date as `YYYY-MM-DD` in GMT, for example: `2009-07-06`, to read recordings that were created on this date. You can also specify an inequality, such as `DateCreated<=YYYY-MM-DD`, to read recordings that were created on or before midnight of this date, and `DateCreated>=YYYY-MM-DD` to read recordings that were created on or after midnight of this date. |
  | `DateCreated>` | string (date-time) | Only include recordings that were created on this date. Specify a date as `YYYY-MM-DD` in GMT, for example: `2009-07-06`, to read recordings that were created on this date. You can also specify an inequality, such as `DateCreated<=YYYY-MM-DD`, to read recordings that were created on or before midnight of this date, and `DateCreated>=YYYY-MM-DD` to read recordings that were created on or after midnight of this date. |
  | `CallSid` | string | The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID of the resources to read. |
  | `ConferenceSid` | string | The Conference SID that identifies the conference associated with the recording to read. |
  | `IncludeSoftDeleted` | boolean | A boolean parameter indicating whether to retrieve soft deleted recordings or not. Recordings metadata are kept after deletion for a retention period of 40 days. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Recordings.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "recordings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Recording)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of recordings belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "recordings"
    )
  end

  @doc """
  Fetch an instance of a recording

  Operation: `FetchRecording` | Tags: Api20100401Recording

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IncludeSoftDeleted` | boolean | A boolean parameter indicating whether to retrieve soft deleted recordings or not. Recordings metadata are kept after deletion for a retention period of 40 days. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Recording.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Recording)}
    end
  end

  @doc """
  Delete a recording from your account

  Operation: `DeleteRecording` | Tags: Api20100401Recording
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
