# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.TranscriptService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Transcripts for a given service.

  Operation: `ListTranscript` | Tags: IntelligenceV2Transcript

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ServiceSid` | string | The unique SID identifier of the Service. |
  | `BeforeStartTime` | string | Filter by before StartTime. |
  | `AfterStartTime` | string | Filter by after StartTime. |
  | `BeforeDateCreated` | string | Filter by before DateCreated. |
  | `AfterDateCreated` | string | Filter by after DateCreated. |
  | `Status` | string | Filter by status. |
  | `LanguageCode` | string | Filter by Language Code. |
  | `SourceSid` | string | Filter by SourceSid. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Transcripts",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "transcripts")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V2.Transcript
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Transcripts for a given service. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "transcripts"
    )
  end

  @doc """
  Create a new Transcript for the service

  Operation: `CreateTranscript` | Tags: IntelligenceV2Transcript

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Channel` | string | JSON object describing Media Channel including Source and Participants |
  | `ServiceSid` | string | The unique SID identifier of the Service. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CustomerKey` | string | Used to store client provided metadata. Maximum of 64 double-byte UTF8 characters. |
  | `MediaStartTime` | string (date-time) | The date that this Transcript's media was started, given in ISO 8601 format. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Transcript.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Transcripts",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Transcript)}
    end
  end

  @doc """
  Fetch a specific Transcript.

  Operation: `FetchTranscript` | Tags: IntelligenceV2Transcript
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Transcript.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Transcripts/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Transcript)}
    end
  end

  @doc """
  Delete a specific Transcript.

  Operation: `DeleteTranscript` | Tags: IntelligenceV2Transcript
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Transcripts/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
