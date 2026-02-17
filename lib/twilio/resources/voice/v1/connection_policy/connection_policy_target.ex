# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.ConnectionPolicy.ConnectionPolicyTarget do
  @moduledoc """
  Network element entry points into your communications infrastructure

  SID prefix: `NE`

  Parent: `/ConnectionPolicies/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Target resource. |
  | `connection_policy_sid` | The SID of the Connection Policy that owns the Target. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `enabled` | Whether the target is enabled. The default is `true`. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `priority` | The relative importance of the target. Can be an integer from 0 to 65535, inclusive, and the default is 10. The lowest number represents the most important target. |
  | `sid` | The unique string that we created to identify the Target resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `target` | The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported.. Format: uri. PII: standard |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `weight` | The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive, and the default is 10. Targets with higher values receive more load than those with lower ones with the same priority. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          connection_policy_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          priority: integer(),
          sid: String.t() | nil,
          target: String.t() | nil,
          url: String.t() | nil,
          weight: integer()
        }

  defstruct [
    :account_sid,
    :connection_policy_sid,
    :date_created,
    :date_updated,
    :enabled,
    :friendly_name,
    :priority,
    :sid,
    :target,
    :url,
    :weight
  ]

  @object_name "voice.v1.connection_policy.connection_policy_target"
  def object_name, do: @object_name

  @sid_prefix "NE"
  def sid_prefix, do: @sid_prefix
end
