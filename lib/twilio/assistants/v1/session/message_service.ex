# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Assistants.V1.Session.MessageService do
  @moduledoc """
  Service for Message API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List messages

  Operation: `ListMessages`
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, session_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sessions/#{session_id}/Messages",
           params: params,
           opts: opts,
           base_url: "https://assistants.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "messages")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Assistants.V1.Session.Message
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List messages (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, session_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, session_id, Map.merge(params, page_opts), opts)
      end,
      "messages"
    )
  end
end
