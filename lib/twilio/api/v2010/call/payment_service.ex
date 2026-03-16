# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.PaymentService do
  @moduledoc """
  Twilio enabled secure payments solution for accepting credit and ACH payments over the phone.

  Operations: `create`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  create an instance of payments. This will start a new payments session

  Operation: `CreatePayments` | Tags: Api20100401Payment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IdempotencyKey` | string | A unique token that will be used to ensure that multiple API calls with the same information do not result in multiple transactions. This should be a unique string value per API call and can be a randomly generated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | Provide an absolute or relative URL to receive status updates regarding your Pay session. Read more about the [expected StatusCallback values](https://www.twilio.com/docs/voice/api/payment-resource#statuscallback) |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BankAccountType` | string |  Values: `consumer-checking`, `consumer-savings`, `commercial-checking` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ChargeAmount` | number | A positive decimal value less than 1,000,000 to charge against the credit card or bank account. Default currency can be overwritten with `currency` field. Leave blank or set to 0 to tokenize. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Confirmation` | string | Whether to prompt the caller to confirm their payment information before submitting to the payment gateway. If `true`, the caller will hear the last 4 digits of their card or account number and must press 1 to confirm or 2 to cancel. Default is `false`. Values: `true`, `false` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Currency` | string | The currency of the `charge_amount`, formatted as [ISO 4127](http://www.iso.org/iso/home/standards/currency_codes.htm) format. The default value is `USD` and all values allowed from the Pay Connector are accepted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Description` | string | The description can be used to provide more details regarding the transaction. This information is submitted along with the payment details to the Payment Connector which are then posted on the transactions. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Input` | string | A list of inputs that should be accepted. Currently only `dtmf` is supported. All digits captured during a pay session are redacted from the logs. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MinPostalCodeLength` | integer | A positive integer that is used to validate the length of the `PostalCode` inputted by the user. User must enter this many digits. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Parameter` | string | A single-level JSON object used to pass custom parameters to payment processors. (Required for ACH payments). The information that has to be included here depends on the <Pay> Connector. [Read more](https://www.twilio.com/console/voice/pay-connectors). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PaymentConnector` | string | This is the unique name corresponding to the Pay Connector installed in the Twilio Add-ons. Learn more about [<Pay> Connectors](https://www.twilio.com/console/voice/pay-connectors). The default value is `Default`. |
  | `PaymentMethod` | string |  Values: `credit-card`, `ach-debit` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PostalCode` | boolean | Indicates whether the credit card postal code (zip code) is a required piece of payment information that must be provided by the caller. The default is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RequireMatchingInputs` | string | A comma-separated list of payment information fields that require the caller to enter the same value twice for confirmation. Supported values are `payment-card-number`, `expiration-date`, `security-code`, and `postal-code`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SecurityCode` | boolean | Indicates whether the credit card security code is a required piece of payment information that must be provided by the caller. The default is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Timeout` | integer | The number of seconds that <Pay> should wait for the caller to press a digit between each subsequent digit, after the first one, before moving on to validate the digits captured. The default is `5`, maximum is `600`. |
  | `TokenType` | string |  Values: `one-time`, `reusable`, `payment-method` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ValidCardTypes` | string | Credit card types separated by space that Pay should accept. The default value is `visa mastercard amex` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Payment.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Payments.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Payment)}
    end
  end

  @doc """
  update an instance of payments with different phases of payment flows.

  Operation: `UpdatePayments` | Tags: Api20100401Payment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IdempotencyKey` | string | A unique token that will be used to ensure that multiple API calls with the same information do not result in multiple transactions. This should be a unique string value per API call and can be a randomly generated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | Provide an absolute or relative URL to receive status updates regarding your Pay session. Read more about the [Update](https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-update) and [Complete/Cancel](https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-cancelcomplete) POST requests. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Capture` | string |  Values: `payment-card-number`, `expiration-date`, `security-code`, `postal-code`, `bank-routing-number`, `bank-account-number`, `payment-card-number-matcher`, `expiration-date-matcher`, `security-code-matcher`, `postal-code-matcher` |
  | `Status` | string |  Values: `complete`, `cancel` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Payment.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, call_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Payments/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Payment)}
    end
  end
end
