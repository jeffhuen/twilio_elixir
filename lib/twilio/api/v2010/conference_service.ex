# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.ConferenceService do
  @moduledoc """
  Voice call conferences

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of conferences belonging to the account used to make the request

  Operation: `ListConference` | Tags: Api20100401Conference

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DateCreated` | string (date) | Only include conferences that were created on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only conferences that were created on this date. You can also specify an inequality, such as `DateCreated<=YYYY-MM-DD`, to read conferences that were created on or before midnight of this date, and `DateCreated>=YYYY-MM-DD` to read conferences that were created on or after midnight of this date. |
  | `DateCreated<` | string (date) | Only include conferences that were created on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only conferences that were created on this date. You can also specify an inequality, such as `DateCreated<=YYYY-MM-DD`, to read conferences that were created on or before midnight of this date, and `DateCreated>=YYYY-MM-DD` to read conferences that were created on or after midnight of this date. |
  | `DateCreated>` | string (date) | Only include conferences that were created on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only conferences that were created on this date. You can also specify an inequality, such as `DateCreated<=YYYY-MM-DD`, to read conferences that were created on or before midnight of this date, and `DateCreated>=YYYY-MM-DD` to read conferences that were created on or after midnight of this date. |
  | `DateUpdated` | string (date) | Only include conferences that were last updated on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only conferences that were last updated on this date. You can also specify an inequality, such as `DateUpdated<=YYYY-MM-DD`, to read conferences that were last updated on or before midnight of this date, and `DateUpdated>=YYYY-MM-DD` to read conferences that were last updated on or after midnight of this date. |
  | `DateUpdated<` | string (date) | Only include conferences that were last updated on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only conferences that were last updated on this date. You can also specify an inequality, such as `DateUpdated<=YYYY-MM-DD`, to read conferences that were last updated on or before midnight of this date, and `DateUpdated>=YYYY-MM-DD` to read conferences that were last updated on or after midnight of this date. |
  | `DateUpdated>` | string (date) | Only include conferences that were last updated on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only conferences that were last updated on this date. You can also specify an inequality, such as `DateUpdated<=YYYY-MM-DD`, to read conferences that were last updated on or before midnight of this date, and `DateUpdated>=YYYY-MM-DD` to read conferences that were last updated on or after midnight of this date. |
  | `FriendlyName` | string | The string that identifies the Conference resources to read. |
  | `Status` | string | The status of the resources to read. Can be: `init`, `in-progress`, or `completed`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Conferences.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "conferences")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Conference)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of conferences belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "conferences"
    )
  end

  @doc """
  Fetch an instance of a conference

  Operation: `FetchConference` | Tags: Api20100401Conference
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference)}
    end
  end

  @doc """


  Operation: `UpdateConference` | Tags: Api20100401Conference

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AnnounceMethod` | string (http-method) | The HTTP method used to call `announce_url`. Can be: `GET` or `POST` and the default is `POST` Values: `GET`, `POST` |
  | `AnnounceUrl` | string (uri) | The URL we should call to announce something into the conference. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs. |
  | `Status` | string |  Values: `completed` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference)}
    end
  end
end
