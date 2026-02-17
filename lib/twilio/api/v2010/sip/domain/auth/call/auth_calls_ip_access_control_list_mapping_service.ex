# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Sip.Domain.Auth.Call.AuthCallsIpAccessControlListMappingService do
  @moduledoc """
  IP address lists for SIP calls

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of IP Access Control List mappings belonging to the domain used in the request

  Operation: `ListSipAuthCallsIpAccessControlListMapping` | Tags: Api20100401AuthCallsIpAccessControlListMapping
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, domain_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
           "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/Auth/Calls/IpAccessControlListMappings.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "contents")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Sip.Domain.Auth.Call.AuthCallsIpAccessControlListMapping
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of IP Access Control List mappings belonging to the domain used in the request (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, domain_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, domain_sid, Map.merge(params, page_opts), opts)
      end,
      "contents"
    )
  end

  @doc """
  Create a new IP Access Control List mapping

  Operation: `CreateSipAuthCallsIpAccessControlListMapping` | Tags: Api20100401AuthCallsIpAccessControlListMapping

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IpAccessControlListSid` | string | The SID of the IpAccessControlList resource to map to the SIP domain. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok,
           Twilio.Resources.Api.V2010.Sip.Domain.Auth.Call.AuthCallsIpAccessControlListMapping.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, domain_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/Auth/Calls/IpAccessControlListMappings.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Domain.Auth.Call.AuthCallsIpAccessControlListMapping
       )}
    end
  end

  @doc """
  Fetch a specific instance of an IP Access Control List mapping

  Operation: `FetchSipAuthCallsIpAccessControlListMapping` | Tags: Api20100401AuthCallsIpAccessControlListMapping
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok,
           Twilio.Resources.Api.V2010.Sip.Domain.Auth.Call.AuthCallsIpAccessControlListMapping.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/Auth/Calls/IpAccessControlListMappings/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Sip.Domain.Auth.Call.AuthCallsIpAccessControlListMapping
       )}
    end
  end

  @doc """
  Delete an IP Access Control List mapping from the requested domain

  Operation: `DeleteSipAuthCallsIpAccessControlListMapping` | Tags: Api20100401AuthCallsIpAccessControlListMapping
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, domain_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/Auth/Calls/IpAccessControlListMappings/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
