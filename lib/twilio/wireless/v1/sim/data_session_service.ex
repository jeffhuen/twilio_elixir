# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Wireless.V1.Sim.DataSessionService do
  @moduledoc """
  Data session information for SIMs

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListDataSession` | Tags: WirelessV1DataSession
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, sim_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sims/#{sim_sid}/DataSessions",
           params: params,
           opts: opts,
           base_url: "https://wireless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "data_sessions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Wireless.V1.Sim.DataSession
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, sim_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, sim_sid, Map.merge(params, page_opts), opts)
      end,
      "data_sessions"
    )
  end
end
