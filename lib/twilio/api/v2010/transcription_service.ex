# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.TranscriptionService do
  @moduledoc """
  Text transcriptions of call recordings

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of transcriptions belonging to the account used to make the request

  Operation: `ListTranscription` | Tags: Api20100401Transcription
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Transcriptions.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "transcriptions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Transcription)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of transcriptions belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "transcriptions"
    )
  end

  @doc """
  Fetch an instance of a Transcription

  Operation: `FetchTranscription` | Tags: Api20100401Transcription
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Transcription.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Transcriptions/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Transcription)}
    end
  end

  @doc """
  Delete a transcription from the account used to make the request

  Operation: `DeleteTranscription` | Tags: Api20100401Transcription
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Transcriptions/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
