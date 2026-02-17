defmodule Twilio.Page do
  @moduledoc """
  Paginated result from a Twilio list endpoint.

  Handles both pagination formats transparently:
  - **Meta wrapper** (v1/v2/v3): `meta.next_page_url`, `meta.key`
  - **Flat format** (v2010): `next_page_uri` at top level, no `meta`
  """

  @type t :: %__MODULE__{
          items: [map()],
          page: non_neg_integer() | nil,
          page_size: non_neg_integer() | nil,
          first_page_url: String.t() | nil,
          previous_page_url: String.t() | nil,
          next_page_url: String.t() | nil,
          url: String.t() | nil,
          key: String.t()
        }

  defstruct [
    :items,
    :page,
    :page_size,
    :first_page_url,
    :previous_page_url,
    :next_page_url,
    :url,
    :key
  ]

  @doc """
  Parse a raw API response into a Page struct.

  Auto-detects the pagination format:
  - If a `"meta"` key is present -> v1/v2/v3 meta wrapper format
  - Otherwise -> v2010 flat format (uses `*_uri` instead of `*_url`)
  """
  @spec from_response(map(), String.t()) :: t()
  def from_response(data, key) do
    case Map.fetch(data, "meta") do
      {:ok, meta} -> from_meta_format(data, key, meta)
      :error -> from_flat_format(data, key)
    end
  end

  @doc "Check if there are more pages."
  @spec has_next?(t()) :: boolean()
  def has_next?(%__MODULE__{next_page_url: nil}), do: false
  def has_next?(%__MODULE__{next_page_url: _}), do: true

  @doc """
  Auto-page through all results as a lazy stream.
  """
  @spec stream((map() -> {:ok, t()} | {:error, term()}), String.t()) :: Enumerable.t()
  def stream(fetch_fn, _key) do
    Stream.unfold(:init, fn
      :done ->
        nil

      :init ->
        case fetch_fn.(%{}) do
          {:ok, %__MODULE__{} = page} -> {page.items, page}
          {:error, _} -> nil
        end

      %__MODULE__{next_page_url: nil} ->
        nil

      %__MODULE__{next_page_url: next_url} ->
        case fetch_fn.(%{"PageToken" => extract_page_token(next_url)}) do
          {:ok, %__MODULE__{} = page} -> {page.items, page}
          {:error, _} -> nil
        end
    end)
    |> Stream.flat_map(& &1)
  end

  # v1/v2/v3 — meta wrapper format
  defp from_meta_format(data, key, meta) do
    %__MODULE__{
      items: Map.get(data, key, []),
      page: meta["page"],
      page_size: meta["page_size"],
      first_page_url: meta["first_page_url"],
      previous_page_url: meta["previous_page_url"],
      next_page_url: meta["next_page_url"],
      url: meta["url"],
      key: key
    }
  end

  # v2010 — flat format (note: *_uri not *_url)
  defp from_flat_format(data, key) do
    %__MODULE__{
      items: Map.get(data, key, []),
      page: data["page"],
      page_size: data["page_size"],
      first_page_url: data["first_page_uri"],
      previous_page_url: data["previous_page_uri"],
      next_page_url: data["next_page_uri"],
      url: data["uri"],
      key: key
    }
  end

  defp extract_page_token(url) do
    uri = URI.parse(url)

    case uri.query do
      nil ->
        nil

      query ->
        URI.decode_query(query)
        |> Map.get("PageToken")
    end
  end
end
