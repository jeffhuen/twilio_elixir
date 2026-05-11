# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.LookupService do
  @moduledoc """
  Service for Lookup API operations.

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Find profiles that contain a specific identifier value (for example a phone number or email address). Submit an identifier object specifying the `idType` and `value`. The value is normalized using the configured identity resolution settings (such as phone number formatting) prior to matching. Multiple matches are returned if more than one profile is associated with the identifier. Returns canonical profile IDs (the earliest ID if profiles have been merged) along with the normalized value actually searched.

  Operation: `CreateProfilesLookup` | Tags: Retrieval
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, store_id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/Stores/#{store_id}/Profiles/Lookup",
      params: params,
      opts: opts,
      base_url: "https://memory.twilio.com",
      content_type: :json
    )
  end
end
