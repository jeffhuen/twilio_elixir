# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Proxy.V1.Service.PhonenumberService do
  @moduledoc """
  Service for Phonenumber API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a list of all Phone Numbers in the Proxy Number Pool for a Service. A maximum of 100 records will be returned per page.

  Operation: `ListPhoneNumber` | Tags: ProxyV1PhoneNumber
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/PhoneNumbers",
           params: params,
           opts: opts,
           base_url: "https://proxy.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "phone_numbers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Proxy.V1.Service.Phonenumber
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of all Phone Numbers in the Proxy Number Pool for a Service. A maximum of 100 records will be returned per page. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "phone_numbers"
    )
  end

  @doc """
  Add a Phone Number to a Service's Proxy Number Pool.

  Operation: `CreatePhoneNumber` | Tags: ProxyV1PhoneNumber

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IsReserved` | boolean | Whether the new phone number should be reserved and not be assigned to a participant using proxy pool logic. See [Reserved Phone Numbers](https://www.twilio.com/docs/proxy/reserved-phone-numbers) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PhoneNumber` | string (phone-number) | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.  E.164 phone numbers consist of a + followed by the country code and subscriber number without punctuation characters. For example, +14155551234. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Sid` | string | The SID of a Twilio [IncomingPhoneNumber](https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource) resource that represents the Twilio Number you would like to assign to your Proxy Service. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Phonenumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/PhoneNumbers",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Phonenumber)}
    end
  end

  @doc """
  Fetch a specific Phone Number.

  Operation: `FetchPhoneNumber` | Tags: ProxyV1PhoneNumber
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Phonenumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/PhoneNumbers/#{sid}",
             opts: opts,
             base_url: "https://proxy.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Phonenumber)}
    end
  end

  @doc """
  Update a specific Proxy Number.

  Operation: `UpdatePhoneNumber` | Tags: ProxyV1PhoneNumber

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IsReserved` | boolean | Whether the phone number should be reserved and not be assigned to a participant using proxy pool logic. See [Reserved Phone Numbers](https://www.twilio.com/docs/proxy/reserved-phone-numbers) for more information. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Phonenumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/PhoneNumbers/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Phonenumber)}
    end
  end

  @doc """
  Delete a specific Phone Number from a Service.

  Operation: `DeletePhoneNumber` | Tags: ProxyV1PhoneNumber
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/PhoneNumbers/#{sid}",
      opts: opts,
      base_url: "https://proxy.twilio.com"
    )
  end
end
