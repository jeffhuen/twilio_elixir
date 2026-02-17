# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Queue do
  @moduledoc """
  Queues of calls

  SID prefix: `QU`

  Parent: `/Accounts/{Sid}.json`

  ## Sub-resources
  - `members` — `/2010-04-01/Accounts/{account_sid}/Queues/{queue_sid}/Members.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Queue resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `average_wait_time` |  The average wait time in seconds of the members in this queue. This is calculated at the time of the request. |
  | `current_size` | The number of calls currently in the queue. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | A string that you assigned to describe this resource. |
  | `max_size` |  The maximum number of calls that can be in the queue. The default is 1000 and the maximum is 5000. |
  | `sid` | The unique string that that we created to identify this Queue resource. |
  | `uri` | The URI of this resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          average_wait_time: integer(),
          current_size: integer(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          max_size: integer(),
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :average_wait_time,
    :current_size,
    :date_created,
    :date_updated,
    :friendly_name,
    :max_size,
    :sid,
    :uri
  ]

  @object_name "api.v2010.account.queue"
  def object_name, do: @object_name

  @sid_prefix "QU"
  def sid_prefix, do: @sid_prefix
end
