# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.Safelist.NumberService do
  @moduledoc """


  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Check if a phone number or phone number 1k prefix exists in SafeList.

  Operation: `FetchSafelist` | Tags: AccountsV1Safelist

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PhoneNumber` | string | The phone number or phone number 1k prefix to be fetched from SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164). |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/SafeList/Numbers",
           params: params,
           opts: opts,
           base_url: "https://accounts.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "numbers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Accounts.V1.Safelist.Number
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Check if a phone number or phone number 1k prefix exists in SafeList. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "numbers"
    )
  end

  @doc """
  Add a new phone number or phone number 1k prefix to SafeList.

  Operation: `CreateSafelist` | Tags: AccountsV1Safelist

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PhoneNumber` | string | The phone number or phone number 1k prefix to be added in SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164). |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.Safelist.Number.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SafeList/Numbers",
             params: params,
             opts: opts,
             base_url: "https://accounts.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.Safelist.Number)}
    end
  end
end
