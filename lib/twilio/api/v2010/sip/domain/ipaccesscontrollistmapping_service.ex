# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Sip.Domain.IpaccesscontrollistmappingService do
  @moduledoc """
  Access control lists associated with a SIP Domain

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of IpAccessControlListMapping resources.

  Operation: `ListSipIpAccessControlListMapping` | Tags: Api20100401IpAccessControlListMapping
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, domain_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/IpAccessControlListMappings.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "ip_access_control_list_mappings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Sip.Domain.Ipaccesscontrollistmapping
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of IpAccessControlListMapping resources. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, domain_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, domain_sid, Map.merge(params, page_opts), opts)
      end,
      "ip_access_control_list_mappings"
    )
  end

  @doc """
  Create a new IpAccessControlListMapping resource.

  Operation: `CreateSipIpAccessControlListMapping` | Tags: Api20100401IpAccessControlListMapping

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IpAccessControlListSid` | string | The unique id of the IP access control list to map to the SIP domain. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.Ipaccesscontrollistmapping.t()}
          | {:error, Twilio.Error.t()}
  def create(client, domain_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/IpAccessControlListMappings.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Domain.Ipaccesscontrollistmapping
       )}
    end
  end

  @doc """
  Fetch an IpAccessControlListMapping resource.

  Operation: `FetchSipIpAccessControlListMapping` | Tags: Api20100401IpAccessControlListMapping
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.Ipaccesscontrollistmapping.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/IpAccessControlListMappings/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Domain.Ipaccesscontrollistmapping
       )}
    end
  end

  @doc """
  Delete an IpAccessControlListMapping resource.

  Operation: `DeleteSipIpAccessControlListMapping` | Tags: Api20100401IpAccessControlListMapping
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, domain_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/IpAccessControlListMappings/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
