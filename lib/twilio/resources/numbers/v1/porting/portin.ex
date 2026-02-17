# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Porting.Portin do
  @moduledoc """
  Portin resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | Account Sid or subaccount where the phone number(s) will be Ported |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `auto_cancel_approval_numbers` | Japan specific field, indicates the number of phone numbers to automatically approve for cancellation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `bundle_sid` | The bundle sid is an optional identifier to reference a group of regulatory documents for a port request. |
  | `date_created` | Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `documents` | List of document SIDs for all phone numbers included in the port in request. At least one document SID referring to a document of the type Utility Bill is required. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `losing_carrier_information` | Details regarding the customer’s information with the losing carrier. These values will be used to generate the letter of authorization and should match the losing carrier’s data as closely as possible to ensure the port is accepted. |
  | `notification_emails` | Additional emails to send a copy of the signed LOA to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `order_cancellation_reason` | If the order is cancelled this field will provide further context on the cause of the cancellation. |
  | `port_in_request_sid` | The SID of the Port In request. This is a unique identifier of the port in request. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `port_in_request_status` | The status of the port in request. The possible values are: In progress, Completed, Expired, In review, Waiting for Signature, Action Required, and Canceled. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `portability_advance_carrier` | A field only required for Japan port in requests. It is a unique identifier for the donor carrier service the line is being ported from. |
  | `signature_request_url` | Format: uri |
  | `support_ticket_id` | Unique ID of the request's support ticket |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `target_port_in_date` | Target date to port the number. We cannot guarantee that this date will be honored by the other carriers, please work with Ops to get a confirmation of the firm order commitment (FOC) date. Expected format is ISO Local Date, example: ‘2011-12-03`. This date must be at least 7 days in the future for US ports and 10 days in the future for Japanese ports. If a start and end range is provided, the date will be converted to its UTC equivalent with the ranges as reference and stored in UTC. We can't guarantee the exact date and time, as this depends on the losing carrier.. Format: date |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `target_port_in_time_range_end` | The latest time that the port should occur on the target port in date. Expected format is ISO Offset Time, example: ‘10:15:00-08:00'. We can't guarantee the exact date and time, as this depends on the losing carrier. The time will be stored and returned as UTC standard timezone. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `target_port_in_time_range_start` | The earliest time that the port should occur on the target port in date. Expected format is ISO Offset Time, example: ‘10:15:00-08:00'. We can't guarantee the exact date and time, as this depends on the losing carrier. The time will be stored and returned as UTC standard timezone. |
  | `url` | The URL of this Port In request. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          auto_cancel_approval_numbers: String.t() | nil,
          bundle_sid: String.t() | nil,
          date_created: String.t() | nil,
          documents: list() | nil,
          losing_carrier_information: String.t() | nil,
          notification_emails: list() | nil,
          order_cancellation_reason: String.t() | nil,
          phone_numbers: list() | nil,
          port_in_request_sid: String.t() | nil,
          port_in_request_status: String.t() | nil,
          portability_advance_carrier: String.t() | nil,
          signature_request_url: String.t() | nil,
          support_ticket_id: integer(),
          target_port_in_date: String.t() | nil,
          target_port_in_time_range_end: String.t() | nil,
          target_port_in_time_range_start: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :auto_cancel_approval_numbers,
    :bundle_sid,
    :date_created,
    :documents,
    :losing_carrier_information,
    :notification_emails,
    :order_cancellation_reason,
    :phone_numbers,
    :port_in_request_sid,
    :port_in_request_status,
    :portability_advance_carrier,
    :signature_request_url,
    :support_ticket_id,
    :target_port_in_date,
    :target_port_in_time_range_end,
    :target_port_in_time_range_start,
    :url
  ]

  @object_name "numbers.v1.porting_port_in"
  def object_name, do: @object_name
end
