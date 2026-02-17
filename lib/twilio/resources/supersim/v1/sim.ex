# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Sim do
  @moduledoc """
  Individual IoT Super SIMs

  SID prefix: `HS`

  ## Sub-resources
  - `billing_periods` — `/v1/Sims/{sim_sid}/BillingPeriods`
  - `sim_ip_addresses` — `/v1/Sims/{sim_sid}/IpAddresses`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Super SIM belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `fleet_sid` | The unique ID of the Fleet configured for this SIM. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `iccid` | The [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID) associated with the SIM.. PII: standard |
  | `links` | Format: uri-map |
  | `sid` | The unique string that identifies the Sim resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Super SIM. Can be `new`, `ready`, `active`, `inactive`, or `scheduled`. See the [Super SIM Status Values](https://www.twilio.com/docs/iot/supersim/api/sim-resource#status-values) for a description of each.. Values: `new`, `ready`, `active`, `inactive`, `scheduled` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `url` | The absolute URL of the Sim Resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          fleet_sid: String.t() | nil,
          iccid: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          status: String.t(),
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :fleet_sid,
    :iccid,
    :links,
    :sid,
    :status,
    :unique_name,
    :url
  ]

  @object_name "supersim.v1.sim"
  def object_name, do: @object_name

  @sid_prefix "HS"
  def sid_prefix, do: @sid_prefix
end
