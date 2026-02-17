# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.Transcript.SentenceService do
  @moduledoc """


  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get all Transcript Sentences by TranscriptSid

  Operation: `ListSentence` | Tags: IntelligenceV2Sentence

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Redacted` | boolean | Grant access to PII Redacted/Unredacted Sentences. If redaction is enabled, the default is `true` to access redacted sentences. |
  | `WordTimestamps` | boolean | Returns word level timestamps information, if word_timestamps is enabled. The default is `false`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, transcript_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Transcripts/#{transcript_sid}/Sentences",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "sentences")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V2.Transcript.Sentence
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get all Transcript Sentences by TranscriptSid (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, transcript_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, transcript_sid, Map.merge(params, page_opts), opts)
      end,
      "sentences"
    )
  end

  @doc """
  Fetch Public Key Encrypted Sentences by TranscriptSid

  Operation: `FetchEncryptedSentences` | Tags: IntelligenceV2EncryptedSentences

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Redacted` | boolean | Grant access to PII Redacted/Unredacted Sentences. If redaction is enabled, the default is `true` to access redacted sentences. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Transcript.Sentence.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, transcript_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Transcripts/#{transcript_sid}/Sentences/Encrypted",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Transcript.Sentence)}
    end
  end
end
