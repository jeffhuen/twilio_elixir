# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Connectionpolicy do
  @moduledoc """
  Connection Policy for sending traffic to your communications infrastructure.

  SID prefix: `NY`

  ## Sub-resources
  - `targets` — `/v1/ConnectionPolicies/{connection_policy_sid}/Targets`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Connection Policy resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Connection Policy resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :friendly_name, :links, :sid, :url]

  @object_name "voice.v1.connection_policy"
  def object_name, do: @object_name

  @sid_prefix "NY"
  def sid_prefix, do: @sid_prefix
end
