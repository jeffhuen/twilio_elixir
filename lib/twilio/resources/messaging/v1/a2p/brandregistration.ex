# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.A2p.Brandregistration do
  @moduledoc """
  A Messaging Service resource to add and fetch Brand Registrations.

  SID prefix: `BN`

  ## Sub-resources
  - `brand_registration_otps` — `/v1/a2p/BrandRegistrations/{brand_registration_sid}/SmsOtp`
  - `brand_vettings` — `/v1/a2p/BrandRegistrations/{brand_sid}/Vettings`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `a2p_profile_bundle_sid` | A2P Messaging Profile Bundle BundleSid. |
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Brand Registration resource. |
  | `brand_feedback` | DEPRECATED. Feedback on how to improve brand score |
  | `brand_score` | The secondary vetting score if it was done. Otherwise, it will be the brand score if it's returned from TCR. It may be null if no score is available. |
  | `brand_type` | Type of brand. One of: "STANDARD", "SOLE_PROPRIETOR". SOLE_PROPRIETOR is for the low volume, SOLE_PROPRIETOR campaign use case. There can only be one SOLE_PROPRIETOR campaign created per SOLE_PROPRIETOR brand. STANDARD is for all other campaign use cases. Multiple campaign use cases can be created per STANDARD brand. |
  | `customer_profile_bundle_sid` | A2P Messaging Profile Bundle BundleSid. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `errors` | A list of errors that occurred during the brand registration process. |
  | `failure_reason` | DEPRECATED. A reason why brand registration has failed. Only applicable when status is FAILED. |
  | `government_entity` | Identified as a government entity |
  | `identity_status` | When a brand is registered, TCR will attempt to verify the identity of the brand based on the supplied information.. Values: `SELF_DECLARED`, `UNVERIFIED`, `VERIFIED`, `VETTED_VERIFIED` |
  | `links` | Format: uri-map |
  | `mock` | A boolean that specifies whether brand should be a mock or not. If true, brand will be registered as a mock brand. Defaults to false if no value is provided. |
  | `russell_3000` | Publicly traded company identified in the Russell 3000 Index |
  | `sid` | The unique string to identify Brand Registration. |
  | `skip_automatic_sec_vet` | A flag to disable automatic secondary vetting for brands which it would otherwise be done. |
  | `status` | Brand Registration status. One of "PENDING", "APPROVED", "FAILED", "IN_REVIEW", "DELETION_PENDING", "DELETION_FAILED", "SUSPENDED".. Values: `PENDING`, `APPROVED`, `FAILED`, `IN_REVIEW`, `DELETION_PENDING`, `DELETION_FAILED`, `SUSPENDED` |
  | `tax_exempt_status` | Nonprofit organization tax-exempt status per section 501 of the U.S. tax code. |
  | `tcr_id` | Campaign Registry (TCR) Brand ID. Assigned only after successful brand registration. |
  | `url` | The absolute URL of the Brand Registration resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          a2p_profile_bundle_sid: String.t() | nil,
          account_sid: String.t() | nil,
          brand_feedback: list() | nil,
          brand_score: integer() | nil,
          brand_type: String.t() | nil,
          customer_profile_bundle_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          errors: list() | nil,
          failure_reason: String.t() | nil,
          government_entity: boolean() | nil,
          identity_status: String.t(),
          links: map() | nil,
          mock: boolean() | nil,
          russell_3000: boolean() | nil,
          sid: String.t() | nil,
          skip_automatic_sec_vet: boolean() | nil,
          status: String.t(),
          tax_exempt_status: String.t() | nil,
          tcr_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :a2p_profile_bundle_sid,
    :account_sid,
    :brand_feedback,
    :brand_score,
    :brand_type,
    :customer_profile_bundle_sid,
    :date_created,
    :date_updated,
    :errors,
    :failure_reason,
    :government_entity,
    :identity_status,
    :links,
    :mock,
    :russell_3000,
    :sid,
    :skip_automatic_sec_vet,
    :status,
    :tax_exempt_status,
    :tcr_id,
    :url
  ]

  @object_name "messaging.v1.brand_registrations"
  def object_name, do: @object_name

  @sid_prefix "BN"
  def sid_prefix, do: @sid_prefix
end
