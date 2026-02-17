# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trunking.V1.Trunk.RecordingService do
  @moduledoc """
  Recording settings for a trunk

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchRecording` | Tags: TrunkingV1Recording
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Recording.t()} | {:error, Twilio.Error.t()}
  def fetch(client, trunk_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/Recording",
             opts: opts,
             base_url: "https://trunking.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Recording)}
    end
  end

  @doc """


  Operation: `UpdateRecording` | Tags: TrunkingV1Recording

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Mode` | string |  Values: `do-not-record`, `record-from-ringing`, `record-from-answer`, `record-from-ringing-dual`, `record-from-answer-dual` |
  | `Trim` | string |  Values: `trim-silence`, `do-not-trim` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Recording.t()} | {:error, Twilio.Error.t()}
  def update(client, trunk_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{trunk_sid}/Recording",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Recording)}
    end
  end
end
