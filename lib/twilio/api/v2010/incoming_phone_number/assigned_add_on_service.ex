# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.IncomingPhoneNumber.AssignedAddOnService do
  @moduledoc """
  Service for AssignedAddOn API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Add-on installations currently assigned to this Number.

  Operation: `ListIncomingPhoneNumberAssignedAddOn` | Tags: Api20100401AssignedAddOn
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, resource_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/#{resource_sid}/AssignedAddOns.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "assigned_add_ons")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Add-on installations currently assigned to this Number. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, resource_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, resource_sid, Map.merge(params, page_opts), opts)
      end,
      "assigned_add_ons"
    )
  end

  @doc """
  Assign an Add-on installation to the Number specified.

  Operation: `CreateIncomingPhoneNumberAssignedAddOn` | Tags: Api20100401AssignedAddOn

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `InstalledAddOnSid` | string | The SID that identifies the Add-on installation. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, resource_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/#{resource_sid}/AssignedAddOns.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn
       )}
    end
  end

  @doc """
  Fetch an instance of an Add-on installation currently assigned to this Number.

  Operation: `FetchIncomingPhoneNumberAssignedAddOn` | Tags: Api20100401AssignedAddOn
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, resource_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/#{resource_sid}/AssignedAddOns/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn
       )}
    end
  end

  @doc """
  Remove the assignment of an Add-on installation from the Number specified.

  Operation: `DeleteIncomingPhoneNumberAssignedAddOn` | Tags: Api20100401AssignedAddOn
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, resource_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/#{resource_sid}/AssignedAddOns/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
