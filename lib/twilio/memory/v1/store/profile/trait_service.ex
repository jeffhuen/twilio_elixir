# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.TraitService do
  @moduledoc """
  Service for Trait API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Return a paginated, optionally filtered list of individual traits for a profile (flattened view). This is useful for UIs or tools that need to browse trait metadata (names, groups, timestamps). Use the optional `traitGroups` filter to scope results and the paging parameters to iterate through larger sets.

  Operation: `ListProfileTraits` | Tags: Traits
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Traits",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "traits")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.Store.Profile.Trait
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Return a paginated, optionally filtered list of individual traits for a profile (flattened view). This is useful for UIs or tools that need to browse trait metadata (names, groups, timestamps). Use the optional `traitGroups` filter to scope results and the paging parameters to iterate through larger sets. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, profile_id, Map.merge(params, page_opts), opts)
      end,
      "traits"
    )
  end
end
