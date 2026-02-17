# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Routes.V2.TrunkService do
  @moduledoc """
  Service for Trunk API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch the Inbound Processing Region assigned to a SIP Trunk.

  Operation: `FetchTrunks` | Tags: RoutesV2Trunk
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Routes.V2.Trunk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Trunks/#{sid}",
             opts: opts,
             base_url: "https://routes.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Routes.V2.Trunk)}
    end
  end

  @doc """
  Assign an Inbound Processing Region to a SIP Trunk

  Operation: `UpdateTrunks` | Tags: RoutesV2Trunk

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A human readable description of this resource, up to 64 characters. |
  | `VoiceRegion` | string | The Inbound Processing Region used for this SIP Trunk for voice |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Routes.V2.Trunk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Trunks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://routes.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Routes.V2.Trunk)}
    end
  end
end
