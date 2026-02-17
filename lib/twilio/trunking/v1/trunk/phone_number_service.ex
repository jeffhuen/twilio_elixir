# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trunking.V1.Trunk.PhoneNumberService do
  @moduledoc """
  Phone numbers associated with trunks

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListPhoneNumber` | Tags: TrunkingV1PhoneNumber
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, trunk_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/PhoneNumbers",
           params: params,
           opts: opts,
           base_url: "https://trunking.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "phone_numbers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trunking.V1.Trunk.PhoneNumber
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, trunk_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, trunk_sid, Map.merge(params, page_opts), opts)
      end,
      "phone_numbers"
    )
  end

  @doc """


  Operation: `CreatePhoneNumber` | Tags: TrunkingV1PhoneNumber

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PhoneNumberSid` | string | The SID of the [Incoming Phone Number](https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource) that you want to associate with the trunk. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.PhoneNumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, trunk_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{trunk_sid}/PhoneNumbers",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.PhoneNumber)}
    end
  end

  @doc """


  Operation: `FetchPhoneNumber` | Tags: TrunkingV1PhoneNumber
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.PhoneNumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, trunk_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/PhoneNumbers/#{sid}",
             opts: opts,
             base_url: "https://trunking.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.PhoneNumber)}
    end
  end

  @doc """


  Operation: `DeletePhoneNumber` | Tags: TrunkingV1PhoneNumber
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, trunk_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Trunks/#{trunk_sid}/PhoneNumbers/#{sid}",
      opts: opts,
      base_url: "https://trunking.twilio.com"
    )
  end
end
