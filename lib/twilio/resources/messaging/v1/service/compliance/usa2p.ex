# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p do
  @moduledoc """
  A service for (fetch/create/delete) A2P Campaign for a Messaging Service

  SID prefix: `QE`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Campaign belongs to. |
  | `age_gated` | A boolean that specifies whether campaign is age gated or not. |
  | `brand_registration_sid` | The unique string to identify the A2P brand. |
  | `campaign_id` | The Campaign Registry (TCR) Campaign ID. |
  | `campaign_status` | Campaign status. Examples: IN_PROGRESS, VERIFIED, FAILED. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `description` | A short description of what this SMS campaign does. Min length: 40 characters. Max length: 4096 characters. |
  | `direct_lending` | A boolean that specifies whether campaign allows direct lending or not. |
  | `errors` | Details indicating why a campaign registration failed. These errors can indicate one or more fields that were incorrect or did not meet review requirements. |
  | `has_embedded_links` | Indicate that this SMS campaign will send messages that contain links. |
  | `has_embedded_phone` | Indicates that this SMS campaign will send messages that contain phone numbers. |
  | `help_keywords` | End users should be able to text in a keyword to receive help. Those keywords must be provided as part of the campaign registration request. This field is required if managing help keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). Values must be alphanumeric. 255 character maximum. |
  | `help_message` | When customers receive the help keywords from their end users, Twilio customers are expected to send back an auto-generated response; this may include the brand name and additional support contact information. This field is required if managing help keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). 20 character minimum. 320 character maximum. |
  | `is_externally_registered` | Indicates whether the campaign was registered externally or not. |
  | `message_flow` | Details around how a consumer opts-in to their campaign, therefore giving consent to receive their messages. If multiple opt-in methods can be used for the same campaign, they must all be listed. 40 character minimum. 2048 character maximum. |
  | `message_samples` | An array of sample message strings, min two and max five. Min length for each sample: 20 chars. Max length for each sample: 1024 chars. |
  | `messaging_service_sid` | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) that the resource is associated with. |
  | `mock` | A boolean that specifies whether campaign is a mock or not. Mock campaigns will be automatically created if using a mock brand. Mock campaigns should only be used for testing purposes. |
  | `opt_in_keywords` | If end users can text in a keyword to start receiving messages from this campaign, those keywords must be provided. This field is required if end users can text in a keyword to start receiving messages from this campaign. Values must be alphanumeric. 255 character maximum. |
  | `opt_in_message` | If end users can text in a keyword to start receiving messages from this campaign, the auto-reply messages sent to the end users must be provided. The opt-in response should include the Brand name, confirmation of opt-in enrollment to a recurring message campaign, how to get help, and clear description of how to opt-out. This field is required if end users can text in a keyword to start receiving messages from this campaign. 20 character minimum. 320 character maximum. |
  | `opt_out_keywords` | End users should be able to text in a keyword to stop receiving messages from this campaign. Those keywords must be provided. This field is required if managing opt out keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). Values must be alphanumeric. 255 character maximum. |
  | `opt_out_message` | Upon receiving the opt-out keywords from the end users, Twilio customers are expected to send back an auto-generated response, which must provide acknowledgment of the opt-out request and confirmation that no further messages will be sent. It is also recommended that these opt-out messages include the brand name. This field is required if managing opt out keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). 20 character minimum. 320 character maximum. |
  | `rate_limits` | Rate limit and/or classification set by each carrier, Ex. AT&T or T-Mobile. |
  | `sid` | The unique string that identifies a US A2P Compliance resource `QE2c6890da8086d771620e9b13fadeba0b`. |
  | `subscriber_opt_in` | A boolean that specifies whether campaign has Subscriber Optin or not. |
  | `url` | The absolute URL of the US App to Person resource.. Format: uri |
  | `us_app_to_person_usecase` | A2P Campaign Use Case. Examples: [ 2FA, EMERGENCY, MARKETING, SOLE_PROPRIETOR...]. SOLE_PROPRIETOR campaign use cases can only be created by SOLE_PROPRIETOR Brands, and there can only be one SOLE_PROPRIETOR campaign created per SOLE_PROPRIETOR Brand. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          age_gated: boolean() | nil,
          brand_registration_sid: String.t() | nil,
          campaign_id: String.t() | nil,
          campaign_status: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          direct_lending: boolean() | nil,
          errors: list() | nil,
          has_embedded_links: boolean() | nil,
          has_embedded_phone: boolean() | nil,
          help_keywords: list() | nil,
          help_message: String.t() | nil,
          is_externally_registered: boolean() | nil,
          message_flow: String.t() | nil,
          message_samples: list() | nil,
          messaging_service_sid: String.t() | nil,
          mock: boolean() | nil,
          opt_in_keywords: list() | nil,
          opt_in_message: String.t() | nil,
          opt_out_keywords: list() | nil,
          opt_out_message: String.t() | nil,
          rate_limits: String.t() | nil,
          sid: String.t() | nil,
          subscriber_opt_in: boolean() | nil,
          url: String.t() | nil,
          us_app_to_person_usecase: String.t() | nil
        }

  defstruct [
    :account_sid,
    :age_gated,
    :brand_registration_sid,
    :campaign_id,
    :campaign_status,
    :date_created,
    :date_updated,
    :description,
    :direct_lending,
    :errors,
    :has_embedded_links,
    :has_embedded_phone,
    :help_keywords,
    :help_message,
    :is_externally_registered,
    :message_flow,
    :message_samples,
    :messaging_service_sid,
    :mock,
    :opt_in_keywords,
    :opt_in_message,
    :opt_out_keywords,
    :opt_out_message,
    :rate_limits,
    :sid,
    :subscriber_opt_in,
    :url,
    :us_app_to_person_usecase
  ]

  @object_name "messaging.v1.service.us_app_to_person"
  def object_name, do: @object_name

  @sid_prefix "QE"
  def sid_prefix, do: @sid_prefix
end
