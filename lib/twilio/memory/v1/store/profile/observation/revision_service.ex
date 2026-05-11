# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.Observation.RevisionService do
  @moduledoc """
  Service for Revision API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a chronologically ordered list of all past revisions of a specific observation by its ID. Revisions represent the complete history of updates and modifications made to an observation, with each revision capturing the full state at the time of change. Revisions are sorted by update time in descending order (newest first), allowing you to track how an observation has evolved through updates over time.

  Operation: `ListObservationRevisions` | Tags: Observations
  """
  @spec list(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, profile_id, observation_id, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Observations/#{observation_id}/Revisions",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "revisions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.Store.Profile.Observation.Revision
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a chronologically ordered list of all past revisions of a specific observation by its ID. Revisions represent the complete history of updates and modifications made to an observation, with each revision capturing the full state at the time of change. Revisions are sorted by update time in descending order (newest first), allowing you to track how an observation has evolved through updates over time. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, profile_id, observation_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, profile_id, observation_id, Map.merge(params, page_opts), opts)
      end,
      "revisions"
    )
  end
end
