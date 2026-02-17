# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trunking.V1.Trunk.IpaccesscontrollistService do
  @moduledoc """
  List of IP addresses for accessing a trunk

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List all IP Access Control Lists for a Trunk

  Operation: `ListIpAccessControlList` | Tags: TrunkingV1IpAccessControlList
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, trunk_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/IpAccessControlLists",
           params: params,
           opts: opts,
           base_url: "https://trunking.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "ip_access_control_lists")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trunking.V1.Trunk.Ipaccesscontrollist
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List all IP Access Control Lists for a Trunk (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, trunk_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, trunk_sid, Map.merge(params, page_opts), opts)
      end,
      "ip_access_control_lists"
    )
  end

  @doc """
  Associate an IP Access Control List with a Trunk

  Operation: `CreateIpAccessControlList` | Tags: TrunkingV1IpAccessControlList

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IpAccessControlListSid` | string | The SID of the [IP Access Control List](https://www.twilio.com/docs/voice/sip/api/sip-ipaccesscontrollist-resource) that you want to associate with the trunk. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Ipaccesscontrollist.t()}
          | {:error, Twilio.Error.t()}
  def create(client, trunk_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{trunk_sid}/IpAccessControlLists",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Ipaccesscontrollist)}
    end
  end

  @doc """


  Operation: `FetchIpAccessControlList` | Tags: TrunkingV1IpAccessControlList
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.Ipaccesscontrollist.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, trunk_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/IpAccessControlLists/#{sid}",
             opts: opts,
             base_url: "https://trunking.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.Ipaccesscontrollist)}
    end
  end

  @doc """
  Remove an associated IP Access Control List from a Trunk

  Operation: `DeleteIpAccessControlList` | Tags: TrunkingV1IpAccessControlList
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, trunk_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Trunks/#{trunk_sid}/IpAccessControlLists/#{sid}",
      opts: opts,
      base_url: "https://trunking.twilio.com"
    )
  end
end
