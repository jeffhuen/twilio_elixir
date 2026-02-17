# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Lookups.V2.PhonenumberService do
  @moduledoc """
  Query information on a phone number so that you can make a trusted interaction with your user

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  The Lookup API allows you to query information on a phone number so that you can make a trusted interaction with your user

  Operation: `FetchPhoneNumber` | Tags: LookupsV2PhoneNumber

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Fields` | string | A comma-separated list of fields to return. Possible values are validation, caller_name, sim_swap, call_forwarding, line_status, line_type_intelligence, identity_match, reassigned_number, sms_pumping_risk, phone_number_quality_score, pre_fill. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CountryCode` | string | The [country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) used if the phone number provided is in national format. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FirstName` | string | User’s first name. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `LastName` | string | User’s last name. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressLine1` | string | User’s first address line. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressLine2` | string | User’s second address line. This query parameter is only used (optionally) for identity_match package requests. |
  | `City` | string | User’s city. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `State` | string | User’s country subdivision, such as state, province, or locality. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PostalCode` | string | User’s postal zip code. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressCountryCode` | string (iso-country-code) | User’s country, up to two characters. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NationalId` | string | User’s national ID, such as SSN or Passport ID. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateOfBirth` | string | User’s date of birth, in YYYYMMDD format. This query parameter is only used (optionally) for identity_match package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `LastVerifiedDate` | string | The date you obtained consent to call or text the end-user of the phone number or a date on which you are reasonably certain that the end-user could still be reached at that number. This query parameter is only used (optionally) for reassigned_number package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationSid` | string | The unique identifier associated with a verification process through verify API. This query parameter is only used (optionally) for pre_fill package requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PartnerSubId` | string | The optional partnerSubId parameter to provide context for your sub-accounts, tenantIDs, sender IDs or other segmentation, enhancing the accuracy of the risk analysis. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Lookups.V2.Phonenumber.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/PhoneNumbers/#{sid}",
             opts: opts,
             base_url: "https://lookups.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Lookups.V2.Phonenumber)}
    end
  end
end
