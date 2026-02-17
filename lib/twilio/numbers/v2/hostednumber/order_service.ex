# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Hostednumber.OrderService do
  @moduledoc """
  Service for Order API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of HostedNumberOrders belonging to the account initiating the request.

  Operation: `ListHostedNumberOrder` | Tags: NumbersV2HostedNumberOrder

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | The Status of this HostedNumberOrder. One of `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, or `action-required`. |
  | `SmsCapability` | boolean | Whether the SMS capability will be hosted on our platform. Can be `true` of `false`. |
  | `PhoneNumber` | string (phone-number) | An E164 formatted phone number hosted by this HostedNumberOrder. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncomingPhoneNumberSid` | string | A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder. |
  | `FriendlyName` | string | A human readable description of this resource, up to 128 characters. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/HostedNumber/Orders",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V2.Hostednumber.Order
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of HostedNumberOrders belonging to the account initiating the request. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  Host a phone number's capability on Twilio's platform.

  Operation: `CreateHostedNumberOrder` | Tags: NumbersV2HostedNumberOrder

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressSid` | string | Optional. A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContactPhoneNumber` | string (phone-number) | The contact phone number of the person authorized to sign the Authorization Document. |
  | `Email` | string | Optional. Email of the owner of this phone number that is being hosted. |
  | `PhoneNumber` | string (phone-number) | The number to host in [+E.164](https://en.wikipedia.org/wiki/E.164) format |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AccountSid` | string | This defaults to the AccountSid of the authorization the user is using. This can be provided to specify a subaccount to add the HostedNumberOrder to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CcEmails` | array | Optional. A list of emails that the LOA document for this HostedNumberOrder will be carbon copied to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContactTitle` | string | The title of the person authorized to sign the Authorization Document for this phone number. |
  | `FriendlyName` | string | A 128 character string that is a human readable text that describes this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsApplicationSid` | string | Optional. The 34 character sid of the application Twilio should use to handle SMS messages sent to this number. If a `SmsApplicationSid` is present, Twilio will ignore all of the SMS urls above and use those set on the application. |
  | `SmsCapability` | boolean | Used to specify that the SMS capability will be hosted on Twilio's platform. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackMethod` | string (http-method) | The HTTP method that should be used to request the SmsFallbackUrl. Must be either `GET` or `POST`. This will be copied onto the IncomingPhoneNumber resource. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackUrl` | string (uri) | A URL that Twilio will request if an error occurs requesting or executing the TwiML defined by SmsUrl. This will be copied onto the IncomingPhoneNumber resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsMethod` | string (http-method) | The HTTP method that should be used to request the SmsUrl. Must be either `GET` or `POST`.  This will be copied onto the IncomingPhoneNumber resource. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsUrl` | string (uri) | The URL that Twilio should request when somebody sends an SMS to the phone number. This will be copied onto the IncomingPhoneNumber resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | Optional. The Status Callback Method attached to the IncomingPhoneNumber resource. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackUrl` | string (uri) | Optional. The Status Callback URL attached to the IncomingPhoneNumber resource. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Hostednumber.Order.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/HostedNumber/Orders",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.Hostednumber.Order)}
    end
  end

  @doc """
  Fetch a specific HostedNumberOrder.

  Operation: `FetchHostedNumberOrder` | Tags: NumbersV2HostedNumberOrder
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Hostednumber.Order.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/HostedNumber/Orders/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.Hostednumber.Order)}
    end
  end

  @doc """
  Updates a specific HostedNumberOrder.

  Operation: `UpdateHostedNumberOrder` | Tags: NumbersV2HostedNumberOrder

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string |  Values: `twilio-processing`, `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, `action-required` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationCallDelay` | integer | The number of seconds to wait before initiating the ownership verification call. Can be a value between 0 and 60, inclusive. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationCallExtension` | string | The numerical extension to dial when making the ownership verification call. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Hostednumber.Order.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/HostedNumber/Orders/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.Hostednumber.Order)}
    end
  end

  @doc """
  Cancel the HostedNumberOrder (only available when the status is in `received`).

  Operation: `DeleteHostedNumberOrder` | Tags: NumbersV2HostedNumberOrder
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/HostedNumber/Orders/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
