# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V1.ContentAndApprovalsService do
  @moduledoc """
  A Content resource represents rich messaging content and its respective approval request status.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Contents with approval statuses belonging to the account used to make the request

  Operation: `ListContentAndApprovals` | Tags: Contentv1ContentAndApprovals
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ContentAndApprovals",
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
                 Twilio.Resources.Content.V1.ContentAndApprovals
               )
         }}

      error ->
        error
    end
  end

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
