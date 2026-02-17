# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Hostednumber.Order.Bulk do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `bulk_hosting_sid` | A 34 character string that uniquely identifies this BulkHostedNumberOrder. |
  | `date_completed` | The date that this resource was completed, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_created` | The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | A 128 character string that is a human-readable text that describes this resource.. PII: standard |
  | `notification_email` | Email address used for send notifications about this Bulk hosted number request.. PII: standard |
  | `request_status` | A string that shows the status of the current Bulk Hosting request, it can vary between these values: 'QUEUED','IN_PROGRESS','PROCESSED'. Values: `QUEUED`, `IN_PROGRESS`, `PROCESSED` |
  | `results` | Contains a list of all the individual hosting orders and their information, for this Bulk request. Each result object is grouped by its order status. To see a complete list of order status, please check 'https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/hosted-number-order-resource#status-values'.. PII: standard |
  | `total_count` | The total count of phone numbers in this Bulk hosting request. |
  | `url` | The URL of this BulkHostedNumberOrder resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          bulk_hosting_sid: String.t() | nil,
          date_completed: String.t() | nil,
          date_created: String.t() | nil,
          friendly_name: String.t() | nil,
          notification_email: String.t() | nil,
          request_status: String.t(),
          results: list() | nil,
          total_count: integer(),
          url: String.t() | nil
        }

  defstruct [
    :bulk_hosting_sid,
    :date_completed,
    :date_created,
    :friendly_name,
    :notification_email,
    :request_status,
    :results,
    :total_count,
    :url
  ]

  @object_name "numbers.v2.bulk_hosted_number_order"
  def object_name, do: @object_name
end
