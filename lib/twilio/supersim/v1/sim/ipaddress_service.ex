# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.Sim.IpaddressService do
  @moduledoc """
  IP Addresses for a Super SIM configured to use a VPN connection

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of IP Addresses for the given Super SIM.

  Operation: `ListSimIpAddress` | Tags: SupersimV1SimIpAddress
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, sim_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sims/#{sim_sid}/IpAddresses",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "ip_addresses")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Supersim.V1.Sim.Ipaddress
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of IP Addresses for the given Super SIM. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, sim_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, sim_sid, Map.merge(params, page_opts), opts)
      end,
      "ip_addresses"
    )
  end
end
