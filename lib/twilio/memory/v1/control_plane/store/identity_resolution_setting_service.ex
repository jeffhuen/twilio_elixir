# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.ControlPlane.Store.IdentityResolutionSettingService do
  @moduledoc """
  Service for IdentityResolutionSetting API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  These settings determine how Customer Memory will use identifiers for searching, 
  merging, and resolving profiles. 
  > Some settings can only take on their default values and are not yet available to change, but coming soon.

  Operation: `FetchIdentityResolutionSettings` | Tags: IdentityResolutionSettings
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.IdentityResolutionSetting.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, store_id, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/ControlPlane/Stores/#{store_id}/IdentityResolutionSettings",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Memory.V1.ControlPlane.Store.IdentityResolutionSetting
       )}
    end
  end
end
