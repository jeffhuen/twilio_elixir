# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.EventService do
  @moduledoc """
  Service for Event API operations.

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  Multiple events can be added to a profile in a single request.
  The maximum number of events per request is 1000 and they will be processed asynchronously.

  Any traits that are configured for identifier promotion will be set as an identifier value on the profile.

  Types of events:

  - `twilio-communication-event` - Twilio communication event, used for tracking multi-channel communications.

  Operation: `CreateProfileEvents` | Tags: Event
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Events",
      params: params,
      opts: opts,
      base_url: "https://memory.twilio.com",
      content_type: :json
    )
  end
end
