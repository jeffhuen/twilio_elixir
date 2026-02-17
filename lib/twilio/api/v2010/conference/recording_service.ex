# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Conference.RecordingService do
  @moduledoc """
  Recordings of conferences

  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of recordings belonging to the call used to make the request

  Operation: `ListConferenceRecording` | Tags: Api20100401ConferenceRecording

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DateCreated` | string (date) | The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date. |
  | `DateCreated<` | string (date) | The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date. |
  | `DateCreated>` | string (date) | The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, conference_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Recordings.json",
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
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Conference.Recording
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of recordings belonging to the call used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, conference_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, conference_sid, Map.merge(params, page_opts), opts)
      end,
      "recordings"
    )
  end

  @doc """
  Fetch an instance of a recording for a call

  Operation: `FetchConferenceRecording` | Tags: Api20100401ConferenceRecording
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.Recording.t()} | {:error, Twilio.Error.t()}
  def fetch(client, conference_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Recordings/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference.Recording)}
    end
  end

  @doc """
  Changes the status of the recording to paused, stopped, or in-progress. Note: To use `Twilio.CURRENT`, pass it as recording sid.

  Operation: `UpdateConferenceRecording` | Tags: Api20100401ConferenceRecording

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `in-progress`, `paused`, `stopped`, `processing`, `completed`, `absent` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PauseBehavior` | string | Whether to record during a pause. Can be: `skip` or `silence` and the default is `silence`. `skip` does not record during the pause period, while `silence` will replace the actual audio of the call with silence during the pause period. This parameter only applies when setting `status` is set to `paused`. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.Recording.t()} | {:error, Twilio.Error.t()}
  def update(client, conference_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Recordings/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference.Recording)}
    end
  end

  @doc """
  Delete a recording from your account

  Operation: `DeleteConferenceRecording` | Tags: Api20100401ConferenceRecording
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, conference_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Recordings/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
