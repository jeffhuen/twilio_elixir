# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.BalanceService do
  @moduledoc """
  Account balance

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch the balance for an Account based on Account Sid. Balance changes may not be reflected immediately. Child accounts do not contain balance information

  Operation: `FetchBalance` | Tags: Api20100401Balance
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/2010-04-01/Accounts/#{client.account_sid}/Balance.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "balance")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Balance)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Fetch the balance for an Account based on Account Sid. Balance changes may not be reflected immediately. Child accounts do not contain balance information (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "balance"
    )
  end
end
