# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.Transcript.MediaService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get download URLs for media if possible

  Operation: `FetchMedia` | Tags: IntelligenceV2Media

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Redacted` | boolean | Grant access to PII Redacted/Unredacted Media. If redaction is enabled, the default is `true` to access redacted media. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Transcript.Media.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Transcripts/#{sid}/Media",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Transcript.Media)}
    end
  end
end
