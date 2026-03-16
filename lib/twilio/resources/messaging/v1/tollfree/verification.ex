# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Tollfree.Verification do
  @moduledoc """
  A Messaging resource to create and retrieve Tollfree Verifications.

  SID prefix: `HH`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `edit_allowed` | If a rejected verification is allowed to be edited/resubmitted. Some rejection reasons allow editing and some do not. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_registration_authority` | The organizational authority for business registrations. Required for all business types except SOLE_PROPRIETOR.. Values: `EIN`, `CBN`, `CRN`, `PROVINCIAL_NUMBER`, `VAT`, `ACN`, `ABN`, `BRN`, `SIREN`, `SIRET`, `NZBN`, `USt-IdNr`, `CIF`, `NIF`, `CNPJ`, `UID`, `NEQ`, `OTHER` |
  | `age_gated_content` | Indicates if the content is age gated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Tollfree Verification resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `opt_in_image_urls` | Link to an image that shows the opt-in workflow. Multiple images allowed and must be a publicly hosted URL. |
  | `rejection_reason` | The rejection reason given when a Tollfree Verification has been rejected. |
  | `use_case_summary` | Use this to further explain how messaging is used by the business or organization. |
  | `additional_information` | Additional information to be provided for verification. |
  | `opt_in_keywords` | List of keywords that users can send to opt in or out of messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_contact_first_name` | The first name of the contact for the business or organization using the Tollfree number. |
  | `business_registration_country` | Country business is registered in |
  | `regulated_item_sid` | The SID of the Regulated Item. |
  | `message_volume` | Estimate monthly volume of messages from the Tollfree Number. |
  | `business_street_address2` | The address of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `tollfree_phone_number` | The E.164 formatted toll-free phone number associated with the verification.. Format: phone-number |
  | `terms_and_conditions_url` | The URL of the terms and conditions for the business or organization.. Format: uri |
  | `error_code` | The error code given when a Tollfree Verification has been rejected. |
  | `url` | The absolute URL of the Tollfree Verification resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_state_province_region` | The state/province/region of the business or organization using the Tollfree number. |
  | `business_city` | The city of the business or organization using the Tollfree number. |
  | `privacy_policy_url` | The URL to the privacy policy for the business or organization.. Format: uri |
  | `business_website` | The website of the business or organization using the Tollfree number. |
  | `help_message_sample` | A sample help message provided to users. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_contact_phone` | The E.164 formatted phone number of the contact for the business or organization using the Tollfree number.. Format: phone-number |
  | `production_message_sample` | An example of message content, i.e. a sample message. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_contact_email` | The email address of the contact for the business or organization using the Tollfree number. |
  | `business_country` | The country of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The compliance status of the Tollfree Verification record.. Values: `PENDING_REVIEW`, `IN_REVIEW`, `TWILIO_APPROVED`, `TWILIO_REJECTED` |
  | `business_street_address` | The address of the business or organization using the Tollfree number. |
  | `business_registration_number` | A legally recognized business registration number |
  | `tollfree_phone_number_sid` | The SID of the Phone Number associated with the Tollfree Verification. |
  | `vetting_id_expiration` | Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `opt_in_type` | Describe how a user opts-in to text messages.. Values: `VERBAL`, `WEB_FORM`, `PAPER_FORM`, `VIA_TEXT`, `MOBILE_QR_CODE`, `IMPORT`, `IMPORT_PLEASE_REPLACE` |
  | `vetting_provider` | The third-party political vetting provider.. Values: `CAMPAIGN_VERIFY` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_contact_last_name` | The last name of the contact for the business or organization using the Tollfree number. |
  | `business_name` | The name of the business or organization using the Tollfree number. |
  | `sid` | The unique string to identify Tollfree Verification. |
  | `resource_links` | The URLs of the documents associated with the Tollfree Verification resource. |
  | `edit_expiration` | The date and time when the ability to edit a rejected verification expires.. Format: date-time |
  | `opt_in_confirmation_message` | The confirmation message sent to users when they opt in to receive messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `business_type` | The type of business, valid values are PRIVATE_PROFIT, PUBLIC_PROFIT, NON_PROFIT, SOLE_PROPRIETOR, GOVERNMENT. Required field.. Values: `PRIVATE_PROFIT`, `PUBLIC_PROFIT`, `SOLE_PROPRIETOR`, `NON_PROFIT`, `GOVERNMENT` |
  | `notification_email` | The email address to receive the notification about the verification result. . |
  | `business_postal_code` | The postal code of the business or organization using the Tollfree number. |
  | `trust_product_sid` | Tollfree TrustProduct Bundle BundleSid. |
  | `business_registration_phone_number` | The E.164 formatted number associated with the business. |
  | `customer_profile_sid` | Customer's Profile Bundle BundleSid. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `doing_business_as` | Trade name, sub entity, or downstream business name of business being submitted for verification |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `external_reference_id` | An optional external reference ID supplied by customer and echoed back on status retrieval. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rejection_reasons` | A list of rejection reasons and codes describing why a Tollfree Verification has been rejected. |
  """

  @type t :: %__MODULE__{
          edit_allowed: boolean() | nil,
          business_registration_authority: String.t(),
          age_gated_content: boolean() | nil,
          account_sid: String.t() | nil,
          date_updated: String.t() | nil,
          opt_in_image_urls: list() | nil,
          rejection_reason: String.t() | nil,
          use_case_summary: String.t() | nil,
          additional_information: String.t() | nil,
          opt_in_keywords: list() | nil,
          business_contact_first_name: String.t() | nil,
          business_registration_country: String.t() | nil,
          regulated_item_sid: String.t() | nil,
          message_volume: String.t() | nil,
          business_street_address2: String.t() | nil,
          tollfree_phone_number: String.t() | nil,
          terms_and_conditions_url: String.t() | nil,
          vetting_id: String.t() | nil,
          error_code: integer() | nil,
          url: String.t() | nil,
          business_state_province_region: String.t() | nil,
          business_city: String.t() | nil,
          use_case_categories: String.t(),
          privacy_policy_url: String.t() | nil,
          business_website: String.t() | nil,
          help_message_sample: String.t() | nil,
          business_contact_phone: String.t() | nil,
          production_message_sample: String.t() | nil,
          date_created: String.t() | nil,
          business_contact_email: String.t() | nil,
          business_country: String.t() | nil,
          status: String.t(),
          business_street_address: String.t() | nil,
          business_registration_number: String.t() | nil,
          tollfree_phone_number_sid: String.t() | nil,
          vetting_id_expiration: String.t() | nil,
          opt_in_type: String.t(),
          vetting_provider: String.t(),
          business_contact_last_name: String.t() | nil,
          business_name: String.t() | nil,
          sid: String.t() | nil,
          resource_links: String.t() | nil,
          edit_expiration: String.t() | nil,
          opt_in_confirmation_message: String.t() | nil,
          business_type: String.t(),
          notification_email: String.t() | nil,
          business_postal_code: String.t() | nil,
          trust_product_sid: String.t() | nil,
          business_registration_phone_number: String.t() | nil,
          customer_profile_sid: String.t() | nil,
          doing_business_as: String.t() | nil,
          external_reference_id: String.t() | nil,
          rejection_reasons: list() | nil
        }

  # credo:disable-for-next-line Credo.Check.Warning.StructFieldAmount
  defstruct [
    :edit_allowed,
    :business_registration_authority,
    :age_gated_content,
    :account_sid,
    :date_updated,
    :opt_in_image_urls,
    :rejection_reason,
    :use_case_summary,
    :additional_information,
    :opt_in_keywords,
    :business_contact_first_name,
    :business_registration_country,
    :regulated_item_sid,
    :message_volume,
    :business_street_address2,
    :tollfree_phone_number,
    :terms_and_conditions_url,
    :vetting_id,
    :error_code,
    :url,
    :business_state_province_region,
    :business_city,
    :use_case_categories,
    :privacy_policy_url,
    :business_website,
    :help_message_sample,
    :business_contact_phone,
    :production_message_sample,
    :date_created,
    :business_contact_email,
    :business_country,
    :status,
    :business_street_address,
    :business_registration_number,
    :tollfree_phone_number_sid,
    :vetting_id_expiration,
    :opt_in_type,
    :vetting_provider,
    :business_contact_last_name,
    :business_name,
    :sid,
    :resource_links,
    :edit_expiration,
    :opt_in_confirmation_message,
    :business_type,
    :notification_email,
    :business_postal_code,
    :trust_product_sid,
    :business_registration_phone_number,
    :customer_profile_sid,
    :doing_business_as,
    :external_reference_id,
    :rejection_reasons
  ]

  @object_name "messaging.v1.tollfree_verification"
  def object_name, do: @object_name

  @sid_prefix "HH"
  def sid_prefix, do: @sid_prefix
end
