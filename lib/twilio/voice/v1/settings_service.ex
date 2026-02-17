# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.SettingsService do
  @moduledoc """


  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve voice dialing permissions inheritance for the sub-account

  Operation: `FetchDialingPermissionsSettings` | Tags: VoiceV1Settings
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Settings.t()} | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Settings",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Settings)}
    end
  end

  @doc """
  Update voice dialing permissions inheritance for the sub-account

  Operation: `UpdateDialingPermissionsSettings` | Tags: VoiceV1Settings

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DialingPermissionsInheritance` | boolean | `true` for the sub-account to inherit voice dialing permissions from the Master Project; otherwise `false`. |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Settings.t()} | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Settings",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Settings)}
    end
  end
end
