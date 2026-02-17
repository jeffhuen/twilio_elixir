# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Hostednumber.HostednumberorderService do
  @moduledoc """
  Service for Hostednumberorder API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of HostedNumberOrders belonging to the account initiating the request.

  Operation: `ListHostedNumbersHostedNumberOrder` | Tags: PreviewHostedNumbersHostedNumberOrder

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | The Status of this HostedNumberOrder. One of `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, or `action-required`. |
  | `PhoneNumber` | string (phone-number) | An E164 formatted phone number hosted by this HostedNumberOrder. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncomingPhoneNumberSid` | string | A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder. |
  | `FriendlyName` | string | A human readable description of this resource, up to 64 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/HostedNumbers/HostedNumberOrders",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Preview.Hostednumber.Hostednumberorder
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

  Operation: `CreateHostedNumbersHostedNumberOrder` | Tags: PreviewHostedNumbersHostedNumberOrder

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PhoneNumber` | string (phone-number) | The number to host in [+E.164](https://en.wikipedia.org/wiki/E.164) format |
  | `SmsCapability` | boolean | Used to specify that the SMS capability will be hosted on Twilio's platform. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AccountSid` | string | This defaults to the AccountSid of the authorization the user is using. This can be provided to specify a subaccount to add the HostedNumberOrder to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressSid` | string | Optional. A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CcEmails` | array | Optional. A list of emails that the LOA document for this HostedNumberOrder will be carbon copied to. |
  | `Email` | string | Optional. Email of the owner of this phone number that is being hosted. |
  | `FriendlyName` | string | A 64 character string that is a human readable text that describes this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsApplicationSid` | string | Optional. The 34 character sid of the application Twilio should use to handle SMS messages sent to this number. If a `SmsApplicationSid` is present, Twilio will ignore all of the SMS urls above and use those set on the application. |
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
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | Optional. Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationDocumentSid` | string | Optional. The unique sid identifier of the Identity Document that represents the document for verifying ownership of the number to be hosted. Required when VerificationType is phone-bill. |
  | `VerificationType` | string |  Values: `phone-call`, `phone-bill` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Hostednumber.Hostednumberorder.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/HostedNumbers/HostedNumberOrders",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Preview.Hostednumber.Hostednumberorder)}
    end
  end

  @doc """
  Fetch a specific HostedNumberOrder.

  Operation: `FetchHostedNumbersHostedNumberOrder` | Tags: PreviewHostedNumbersHostedNumberOrder
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Hostednumber.Hostednumberorder.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/HostedNumbers/HostedNumberOrders/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Preview.Hostednumber.Hostednumberorder)}
    end
  end

  @doc """
  Updates a specific HostedNumberOrder.

  Operation: `UpdateHostedNumbersHostedNumberOrder` | Tags: PreviewHostedNumbersHostedNumberOrder

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallDelay` | integer | The number of seconds, between 0 and 60, to delay before initiating the verification call. Defaults to 0. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CcEmails` | array | Optional. A list of emails that LOA document for this HostedNumberOrder will be carbon copied to. |
  | `Email` | string | Email of the owner of this phone number that is being hosted. |
  | `Extension` | string | Digits to dial after connecting the verification call. |
  | `FriendlyName` | string | A 64 character string that is a human readable text that describes this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string |  Values: `twilio-processing`, `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, `action-required` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationCode` | string | A verification code that is given to the user via a phone call to the phone number that is being hosted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationDocumentSid` | string | Optional. The unique sid identifier of the Identity Document that represents the document for verifying ownership of the number to be hosted. Required when VerificationType is phone-bill. |
  | `VerificationType` | string |  Values: `phone-call`, `phone-bill` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Hostednumber.Hostednumberorder.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/HostedNumbers/HostedNumberOrders/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Preview.Hostednumber.Hostednumberorder)}
    end
  end

  @doc """
  Cancel the HostedNumberOrder (only available when the status is in `received`).

  Operation: `DeleteHostedNumbersHostedNumberOrder` | Tags: PreviewHostedNumbersHostedNumberOrder
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/HostedNumbers/HostedNumberOrders/#{sid}",
      opts: opts,
      base_url: "https://preview.twilio.com"
    )
  end
end
