# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.TranscriptionService do
  @moduledoc """
  Service for Transcription API operations.

  Operations: `create`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a Transcription

  Operation: `CreateRealtimeTranscription` | Tags: Api20100401CallTranscription

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConversationConfiguration` | string | The ID of the Conversations Configuration for customizing conversation behavior in Intelligence Service |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConversationId` | string | The ID of the Conversation for associating this Transcription with an existing Conversation in Intelligence Service |
  | `EnableAutomaticPunctuation` | boolean | The provider will add punctuation to recognition result |
  | `EnableProviderData` | boolean | Whether the callback includes raw provider data. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Hints` | string | A Phrase contains words and phrase "hints" so that the speech recognition engine is more likely to recognize them. |
  | `InboundTrackLabel` | string | Friendly name given to the Inbound Track |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IntelligenceService` | string | The SID or unique name of the [Intelligence Service](https://www.twilio.com/docs/conversational-intelligence/api/service-resource) for persisting transcripts and running post-call Language Operators |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `LanguageCode` | string | Language code used by the transcription engine, specified in [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) format |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Name` | string | The user-specified name of this Transcription, if one was given when the Transcription was created. This may be used to stop the Transcription. |
  | `OutboundTrackLabel` | string | Friendly name given to the Outbound Track |
  | `PartialResults` | boolean | Indicates if partial results are going to be sent to the customer |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ProfanityFilter` | boolean | indicates if the server will attempt to filter out profanities, replacing all but the initial character in each filtered word with asterisks |
  | `SpeechModel` | string | Recognition model used by the transcription engine, among those supported by the provider |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The http method for the status_callback (one of GET, POST). Values: `GET`, `POST` |
  | `StatusCallbackUrl` | string (uri) | Absolute URL of the status callback. |
  | `Track` | string |  Values: `inbound_track`, `outbound_track`, `both_tracks` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TranscriptionEngine` | string | Definition of the transcription engine to be used, among those supported by Twilio |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Transcription.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Transcriptions.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Transcription)}
    end
  end

  @doc """
  Stop a Transcription using either the SID of the Transcription resource or the `name` used when creating the resource

  Operation: `UpdateRealtimeTranscription` | Tags: Api20100401CallTranscription

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `stopped` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Transcription.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, call_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Transcriptions/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Transcription)}
    end
  end
end
