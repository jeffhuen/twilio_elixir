# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Sip.Ipaccesscontrollist.IpaddressService do
  @moduledoc """
  IP addresses that have access to a SIP Domain

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Read multiple IpAddress resources.

  Operation: `ListSipIpAddress` | Tags: Api20100401SipIpAddress
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, ip_access_control_list_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/SIP/IpAccessControlLists/#{ip_access_control_list_sid}/IpAddresses.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "ip_addresses")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Read multiple IpAddress resources. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, ip_access_control_list_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, ip_access_control_list_sid, Map.merge(params, page_opts), opts)
      end,
      "ip_addresses"
    )
  end

  @doc """
  Create a new IpAddress resource.

  Operation: `CreateSipIpAddress` | Tags: Api20100401SipIpAddress

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A human readable descriptive text for this resource, up to 255 characters long. |
  | `IpAddress` | string | An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CidrPrefixLength` | integer | An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress.t()}
          | {:error, Twilio.Error.t()}
  def create(client, ip_access_control_list_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/IpAccessControlLists/#{ip_access_control_list_sid}/IpAddresses.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress
       )}
    end
  end

  @doc """
  Read one IpAddress resource.

  Operation: `FetchSipIpAddress` | Tags: Api20100401SipIpAddress
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, ip_access_control_list_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/IpAccessControlLists/#{ip_access_control_list_sid}/IpAddresses/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress
       )}
    end
  end

  @doc """
  Update an IpAddress resource.

  Operation: `UpdateSipIpAddress` | Tags: Api20100401SipIpAddress

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CidrPrefixLength` | integer | An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used. |
  | `FriendlyName` | string | A human readable descriptive text for this resource, up to 255 characters long. |
  | `IpAddress` | string | An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress.t()}
          | {:error, Twilio.Error.t()}
  def update(client, ip_access_control_list_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/IpAccessControlLists/#{ip_access_control_list_sid}/IpAddresses/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress
       )}
    end
  end

  @doc """
  Delete an IpAddress resource.

  Operation: `DeleteSipIpAddress` | Tags: Api20100401SipIpAddress
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, ip_access_control_list_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/SIP/IpAccessControlLists/#{ip_access_control_list_sid}/IpAddresses/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
