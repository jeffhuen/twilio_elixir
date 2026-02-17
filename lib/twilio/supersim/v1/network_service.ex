# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.NetworkService do
  @moduledoc """
  Mobile operator networks to which Super SIMs can connect

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Network resources.

  Operation: `ListNetwork` | Tags: SupersimV1Network

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IsoCountry` | string | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the Network resources to read. |
  | `Mcc` | string | The 'mobile country code' of a country. Network resources with this `mcc` in their `identifiers` will be read. |
  | `Mnc` | string | The 'mobile network code' of a mobile operator network. Network resources with this `mnc` in their `identifiers` will be read. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Networks",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "networks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Supersim.V1.Network)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Network resources. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "networks"
    )
  end

  @doc """
  Fetch a Network resource.

  Operation: `FetchNetwork` | Tags: SupersimV1Network
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Network.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Networks/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Network)}
    end
  end
end
