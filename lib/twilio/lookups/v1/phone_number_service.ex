# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Lookups.V1.PhoneNumberService do
  @moduledoc """
  Detailed information on phone numbers

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchPhoneNumber` | Tags: LookupsV1PhoneNumber

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CountryCode` | string | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the phone number to fetch. This is used to specify the country when the phone number is provided in a national format. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Type` | array | The type of information to return. Can be: `carrier` or `caller-name`. The default is null. To retrieve both types of information, specify this parameter twice; once with `carrier` and once with `caller-name` as the value. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddOns` | array | The `unique_name` of an Add-on you would like to invoke. Can be the `unique_name` of an Add-on that is installed on your account. You can specify multiple instances of this parameter to invoke multiple Add-ons. For more information about  Add-ons, see the [Add-ons documentation](https://www.twilio.com/docs/add-ons). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddOnsData` | object (prefixed-collapsible-map-AddOns) | Data specific to the add-on you would like to invoke. The content and format of this value depends on the add-on. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Lookups.V1.PhoneNumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/PhoneNumbers/#{sid}",
             opts: opts,
             base_url: "https://lookups.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Lookups.V1.PhoneNumber)}
    end
  end
end
