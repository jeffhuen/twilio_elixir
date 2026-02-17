# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket do
  @moduledoc """
  Bucket resource.

  SID prefix: `BL`

  Parent: `/Services/{ServiceSid}/RateLimits/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Rate Limit resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `interval` | Number of seconds that the rate limit will be enforced over. |
  | `max` | Maximum number of requests permitted in during the interval. |
  | `rate_limit_sid` | The Twilio-provided string that uniquely identifies the Rate Limit resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with. |
  | `sid` | A 34 character string that uniquely identifies this Bucket. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          interval: integer(),
          max: integer(),
          rate_limit_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :interval,
    :max,
    :rate_limit_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "verify.v2.service.rate_limit.bucket"
  def object_name, do: @object_name

  @sid_prefix "BL"
  def sid_prefix, do: @sid_prefix
end
