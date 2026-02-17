# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V1.LegacycontentService do
  @moduledoc """
  A Legacy Content resource represents legacy rich messaging content.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Legacy Contents belonging to the account used to make the request

  Operation: `ListLegacyContent` | Tags: Contentv1LegacyContent
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/LegacyContent",
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
                 Twilio.Resources.Content.V1.Legacycontent
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of Legacy Contents belonging to the account used to make the request (lazy auto-pagination)."
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
