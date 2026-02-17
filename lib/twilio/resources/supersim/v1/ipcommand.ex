# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Ipcommand do
  @moduledoc """
  Machine-to-machine IP Commands sent to/from Super SIMs

  SID prefix: `HG`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the IP Command resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `device_ip` | The IP address of the device that the IP Command was sent to or received from. For an IP Command sent to a Super SIM, `device_ip` starts out as `null`, and once the IP Command is “sent”, the `device_ip` will be filled out. An IP Command sent from a Super SIM have its `device_ip` always set. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `device_port` | For an IP Command sent to a Super SIM, it would be the destination port of the IP message. For an IP Command sent from a Super SIM, it would be the source port of the IP message. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `direction` | Either `to_sim` or `from_sim`. Indicates whether the IP Command resource was sent from or to the Super SIM.. Values: `to_sim`, `from_sim` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `payload` | The payload that is carried in the IP/UDP message. The payload can be encoded in either text or binary format. For text payload, UTF-8 encoding must be used.  For an IP Command sent to a Super SIM, the payload is appended to the IP/UDP message “as is”. The payload should not exceed 1300 bytes.  For an IP Command sent from a Super SIM, the payload from the received IP/UDP message is extracted and sent in binary encoding. For an IP Command sent from a Super SIM, the payload should not exceed 1300 bytes. If it is larger than 1300 bytes, there might be fragmentation on the upstream and the message may appear truncated.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `payload_type` | Either “text” or “binary”. For an IP Command sent to a Super SIM, `payload_type` is configurable. For an IP Command sent from a Super SIM, `payload_type` is always “binary”.. Values: `text`, `binary` |
  | `sid` | The unique string that we created to identify the IP Command resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sim_iccid` | The [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID) of the [Super SIM](https://www.twilio.com/docs/iot/supersim/api/sim-resource) that this IP Command was sent to or from. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sim_sid` | The SID of the [Super SIM](https://www.twilio.com/docs/iot/supersim/api/sim-resource) that this IP Command was sent to or from. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The delivery status of the IP Command. This is one of the following: “queued”, “sent”, “failed” or “received”.. Values: `queued`, `sent`, `received`, `failed` |
  | `url` | The absolute URL of the IP Command resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          device_ip: String.t() | nil,
          device_port: integer(),
          direction: String.t(),
          payload: String.t() | nil,
          payload_type: String.t(),
          sid: String.t() | nil,
          sim_iccid: String.t() | nil,
          sim_sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :device_ip,
    :device_port,
    :direction,
    :payload,
    :payload_type,
    :sid,
    :sim_iccid,
    :sim_sid,
    :status,
    :url
  ]

  @object_name "supersim.v1.ip_command"
  def object_name, do: @object_name

  @sid_prefix "HG"
  def sid_prefix, do: @sid_prefix
end
