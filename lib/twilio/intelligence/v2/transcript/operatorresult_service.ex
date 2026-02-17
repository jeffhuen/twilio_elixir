# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.Transcript.OperatorresultService do
  @moduledoc """
  Service for Operatorresult API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Operator Results for the given Transcript.

  Operation: `ListOperatorResult` | Tags: IntelligenceV2OperatorResult

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Redacted` | boolean | Grant access to PII redacted/unredacted Language Understanding operator. If redaction is enabled, the default is True. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, transcript_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Transcripts/#{transcript_sid}/OperatorResults",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "operator_results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V2.Transcript.Operatorresult
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Operator Results for the given Transcript. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, transcript_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, transcript_sid, Map.merge(params, page_opts), opts)
      end,
      "operator_results"
    )
  end

  @doc """
  Fetch Public Key Encrypted Operator Results by TranscriptSid

  Operation: `FetchEncryptedOperatorResults` | Tags: IntelligenceV2EncryptedOperatorResults

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Redacted` | boolean | Grant access to PII Redacted/Unredacted Operator Results. If redaction is enabled, the default is `true` to access redacted operator results. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Transcript.Operatorresult.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, transcript_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Transcripts/#{transcript_sid}/OperatorResults/Encrypted",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Transcript.Operatorresult)}
    end
  end
end
