# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Incomingphonenumber.Assignedaddon.AssignedAddOnExtensionService do
  @moduledoc """
  Service for AssignedAddOnExtension API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Extensions for the Assigned Add-on.

  Operation: `ListIncomingPhoneNumberAssignedAddOnExtension` | Tags: Api20100401AssignedAddOnExtension
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, resource_sid, assigned_add_on_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
           "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/#{resource_sid}/AssignedAddOns/#{assigned_add_on_sid}/Extensions.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "extensions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Incomingphonenumber.Assignedaddon.AssignedAddOnExtension
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Extensions for the Assigned Add-on. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, resource_sid, assigned_add_on_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, resource_sid, assigned_add_on_sid, Map.merge(params, page_opts), opts)
      end,
      "extensions"
    )
  end

  @doc """
  Fetch an instance of an Extension for the Assigned Add-on.

  Operation: `FetchIncomingPhoneNumberAssignedAddOnExtension` | Tags: Api20100401AssignedAddOnExtension
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok,
           Twilio.Resources.Api.V2010.Incomingphonenumber.Assignedaddon.AssignedAddOnExtension.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, resource_sid, assigned_add_on_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/#{resource_sid}/AssignedAddOns/#{assigned_add_on_sid}/Extensions/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Incomingphonenumber.Assignedaddon.AssignedAddOnExtension
       )}
    end
  end
end
