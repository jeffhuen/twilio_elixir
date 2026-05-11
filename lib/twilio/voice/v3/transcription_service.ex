# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V3.TranscriptionService do
  @moduledoc """
  Service for Transcription API operations.

  Operations: `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Transcription.

  Operation: `CreateV3Transcriptions` | Tags: V3Transcriptions
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V3.Transcription.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v3/Transcriptions",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V3.Transcription)}
    end
  end

  @doc """
  Fetch a Transcription.

  Operation: `FetchTranscription` | Tags: V3Transcriptions
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V3.Transcription.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v3/Transcriptions/#{sid}",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V3.Transcription)}
    end
  end
end
