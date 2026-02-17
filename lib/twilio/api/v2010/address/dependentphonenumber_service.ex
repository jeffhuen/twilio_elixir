# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Address.DependentphonenumberService do
  @moduledoc """
  Phone numbers dependent on an Address resource

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListDependentPhoneNumber` | Tags: Api20100401DependentPhoneNumber
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, address_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Addresses/#{address_sid}/DependentPhoneNumbers.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "dependent_phone_numbers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Address.Dependentphonenumber
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, address_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, address_sid, Map.merge(params, page_opts), opts)
      end,
      "dependent_phone_numbers"
    )
  end
end
