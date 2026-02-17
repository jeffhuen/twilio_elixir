# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Availablephonenumber.VoipService do
  @moduledoc """
  Available VoIP phone numbers

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListAvailablePhoneNumberVoip` | Tags: Api20100401Voip

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AreaCode` | integer | The area code of the phone numbers to read. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Contains` | string | Matching pattern to identify phone numbers. This pattern can be between 2 and 16 characters long and allows all digits (0-9) and all non-diacritic latin alphabet letters (a-z, A-Z). It accepts four meta-characters: `*`, `%`, `+`, `$`. The `*` and `%` meta-characters can appear multiple times in the pattern. To match wildcards at the beginning or end of the pattern, use `*` to match any single character or `%` to match a sequence of characters. If you use the wildcard patterns, it must include at least two non-meta-characters, and wildcards cannot be used between non-meta-characters. To match the beginning of a pattern, start the pattern with `+`. To match the end of the pattern, append the pattern with `$`. These meta-characters can't be adjacent to each other. |
  | `SmsEnabled` | boolean | Whether the phone numbers can receive text messages. Can be: `true` or `false`. |
  | `MmsEnabled` | boolean | Whether the phone numbers can receive MMS messages. Can be: `true` or `false`. |
  | `VoiceEnabled` | boolean | Whether the phone numbers can receive calls. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ExcludeAllAddressRequired` | boolean | Whether to exclude phone numbers that require an [Address](https://www.twilio.com/docs/usage/api/address). Can be: `true` or `false` and the default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ExcludeLocalAddressRequired` | boolean | Whether to exclude phone numbers that require a local [Address](https://www.twilio.com/docs/usage/api/address). Can be: `true` or `false` and the default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ExcludeForeignAddressRequired` | boolean | Whether to exclude phone numbers that require a foreign [Address](https://www.twilio.com/docs/usage/api/address). Can be: `true` or `false` and the default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Beta` | boolean | Whether to read phone numbers that are new to the Twilio platform. Can be: `true` or `false` and the default is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NearNumber` | string (phone-number) | Given a phone number, find a geographically close number within `distance` miles. Distance defaults to 25 miles. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NearLatLong` | string | Given a latitude/longitude pair `lat,long` find geographically close numbers within `distance` miles. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Distance` | integer | The search radius, in miles, for a `near_` query.  Can be up to `500` and the default is `25`. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InPostalCode` | string | Limit results to a particular postal code. Given a phone number, search within the same postal code as that number. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InRegion` | string | Limit results to a particular region, state, or province. Given a phone number, search within the same region as that number. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InRateCenter` | string | Limit results to a specific rate center, or given a phone number search within the same rate center as that number. Requires `in_lata` to be set as well. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InLata` | string | Limit results to a specific local access and transport area ([LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area)). Given a phone number, search within the same [LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area) as that number. Applies to only phone numbers in the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InLocality` | string | Limit results to a particular locality or city. Given a phone number, search within the same Locality as that number. |
  | `FaxEnabled` | boolean | Whether the phone numbers can receive faxes. Can be: `true` or `false`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, country_code, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/AvailablePhoneNumbers/#{country_code}/Voip.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "available_phone_numbers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Availablephonenumber.Voip
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, country_code, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, country_code, Map.merge(params, page_opts), opts)
      end,
      "available_phone_numbers"
    )
  end
end
