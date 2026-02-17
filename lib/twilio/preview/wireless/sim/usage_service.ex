# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Wireless.Sim.UsageService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchWirelessUsage` | Tags: PreviewWirelessUsage

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `End` | string |  |
  | `Start` | string |  |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Sim.Usage.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sim_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/wireless/Sims/#{sim_sid}/Usage",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Sim.Usage)}
    end
  end
end
