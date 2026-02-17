# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Sip.Domain.CredentiallistmappingService do
  @moduledoc """
  Credential lists associated with a SIP Domain

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Read multiple CredentialListMapping resources from an account.

  Operation: `ListSipCredentialListMapping` | Tags: Api20100401CredentialListMapping
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, domain_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/CredentialListMappings.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credential_list_mappings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Sip.Domain.Credentiallistmapping
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Read multiple CredentialListMapping resources from an account. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, domain_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, domain_sid, Map.merge(params, page_opts), opts)
      end,
      "credential_list_mappings"
    )
  end

  @doc """
  Create a CredentialListMapping resource for an account.

  Operation: `CreateSipCredentialListMapping` | Tags: Api20100401CredentialListMapping

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CredentialListSid` | string | A 34 character string that uniquely identifies the CredentialList resource to map to the SIP domain. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.Credentiallistmapping.t()}
          | {:error, Twilio.Error.t()}
  def create(client, domain_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/CredentialListMappings.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Sip.Domain.Credentiallistmapping)}
    end
  end

  @doc """
  Fetch a single CredentialListMapping resource from an account.

  Operation: `FetchSipCredentialListMapping` | Tags: Api20100401CredentialListMapping
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.Credentiallistmapping.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/CredentialListMappings/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Sip.Domain.Credentiallistmapping)}
    end
  end

  @doc """
  Delete a CredentialListMapping resource from an account.

  Operation: `DeleteSipCredentialListMapping` | Tags: Api20100401CredentialListMapping
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, domain_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{domain_sid}/CredentialListMappings/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
