# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Voice.SettingService do
  @moduledoc """


  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get the Voice Insights Settings.

  Operation: `FetchAccountSettings` | Tags: InsightsV1Setting

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SubaccountSid` | string | The unique SID identifier of the Subaccount. |
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.Setting.t()} | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Voice/Settings",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.Setting)}
    end
  end

  @doc """
  Update a specific Voice Insights Setting.

  Operation: `UpdateAccountSettings` | Tags: InsightsV1Setting

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AdvancedFeatures` | boolean | A boolean flag to enable Advanced Features for Voice Insights. |
  | `SubaccountSid` | string | The unique SID identifier of the Subaccount. |
  | `VoiceTrace` | boolean | A boolean flag to enable Voice Trace. |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.Setting.t()} | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Voice/Settings",
             params: params,
             opts: opts,
             base_url: "https://insights.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.Setting)}
    end
  end
end
