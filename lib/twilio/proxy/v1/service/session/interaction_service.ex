# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Proxy.V1.Service.Session.InteractionService do
  @moduledoc """


  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Interactions for a Session. A maximum of 100 records will be returned per page.

  Operation: `ListInteraction` | Tags: ProxyV1Interaction
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, session_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Interactions",
           params: params,
           opts: opts,
           base_url: "https://proxy.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "interactions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Proxy.V1.Service.Session.Interaction
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Interactions for a Session. A maximum of 100 records will be returned per page. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, session_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, session_sid, Map.merge(params, page_opts), opts)
      end,
      "interactions"
    )
  end

  @doc """
  Retrieve a list of Interactions for a given [Session](https://www.twilio.com/docs/proxy/api/session).

  Operation: `FetchInteraction` | Tags: ProxyV1Interaction
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.Interaction.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, session_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Interactions/#{sid}",
             opts: opts,
             base_url: "https://proxy.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Session.Interaction)}
    end
  end

  @doc """
  Delete a specific Interaction.

  Operation: `DeleteInteraction` | Tags: ProxyV1Interaction
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, session_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Interactions/#{sid}",
      opts: opts,
      base_url: "https://proxy.twilio.com"
    )
  end
end
