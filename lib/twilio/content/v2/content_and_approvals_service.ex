# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V2.ContentAndApprovalsService do
  @moduledoc """
  A Content resource represents rich messaging content and its respective approval request status.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Contents with approval statuses belonging to the account used to make the request

  Operation: `ListContentAndApprovals` | Tags: ContentV2ContentAndApprovals

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SortByDate` | string | Whether to sort by ascending or descending date updated |
  | `SortByContentName` | string | Whether to sort by ascending or descending content name |
  | `DateCreatedAfter` | string (date-time) | Filter by >=[date-time] |
  | `DateCreatedBefore` | string (date-time) | Filter by <=[date-time] |
  | `ContentName` | string | Filter by Regex Pattern in content name |
  | `Content` | string | Filter by Regex Pattern in template content |
  | `Language` | array | Filter by array of valid language(s) |
  | `ContentType` | array | Filter by array of contentType(s) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ChannelEligibility` | array | Filter by array of ChannelEligibility(s), where ChannelEligibility=<channel>:<status> |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/ContentAndApprovals",
           params: params,
           opts: opts,
           base_url: "https://content.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "contents")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Content.V2.ContentAndApprovals
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of Contents with approval statuses belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "contents"
    )
  end
end
