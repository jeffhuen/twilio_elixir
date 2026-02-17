# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Ratelimit do
  @moduledoc """


  SID prefix: `RK`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `buckets` — `/v2/Services/{service_sid}/RateLimits/{rate_limit_sid}/Buckets`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Rate Limit resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `description` | Description of this Rate Limit |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with. |
  | `sid` | A 34 character string that uniquely identifies this Rate Limit. |
  | `unique_name` | Provides a unique and addressable name to be assigned to this Rate Limit, assigned by the developer, to be optionally used in addition to SID. **This value should not contain PII.** |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          links: map() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :description,
    :links,
    :service_sid,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "verify.v2.service.rate_limit"
  def object_name, do: @object_name

  @sid_prefix "RK"
  def sid_prefix, do: @sid_prefix
end
