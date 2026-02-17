# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Esimprofile do
  @moduledoc """
  eSIM Profiles that can be loaded onto consumer eUICC SIMs

  SID prefix: `HP`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the eSIM Profile resource belongs. |
  | `activation_code` | Combined machine-readable activation code for acquiring an eSIM Profile with the Activation Code download method. Can be used in a QR code to download an eSIM profile. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `eid` | Identifier of the eUICC that can claim the eSIM Profile. |
  | `error_code` | Code indicating the failure if the download of the SIM Profile failed and the eSIM Profile is in `failed` state. |
  | `error_message` | Error message describing the failure if the download of the SIM Profile failed and the eSIM Profile is in `failed` state. |
  | `iccid` | The [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID) associated with the Sim resource.. PII: standard |
  | `matching_id` | Unique identifier of the eSIM profile that can be used to identify and download the eSIM profile from the SM-DP+ server. Populated if `generate_matching_id` is set to `true` when creating the eSIM profile reservation. |
  | `sid` | The unique string that we created to identify the eSIM Profile resource. |
  | `sim_sid` | The SID of the [Sim](https://www.twilio.com/docs/iot/supersim/api/sim-resource) resource that this eSIM Profile controls. |
  | `smdp_plus_address` | Address of the SM-DP+ server from which the Profile will be downloaded. The URL will appear once the eSIM Profile reaches the status `available`.. Format: uri |
  | `status` | The status of the eSIM Profile. Can be: `new`, `reserving`, `available`, `downloaded`, `installed` or `failed`. See the [eSIM Profile Status Values](https://www.twilio.com/docs/iot/supersim/api/esimprofile-resource#status-values) for a description of each.. Values: `new`, `reserving`, `available`, `downloaded`, `installed`, `failed` |
  | `url` | The absolute URL of the eSIM Profile resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          activation_code: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          eid: String.t() | nil,
          error_code: String.t() | nil,
          error_message: String.t() | nil,
          iccid: String.t() | nil,
          matching_id: String.t() | nil,
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          smdp_plus_address: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :activation_code,
    :date_created,
    :date_updated,
    :eid,
    :error_code,
    :error_message,
    :iccid,
    :matching_id,
    :sid,
    :sim_sid,
    :smdp_plus_address,
    :status,
    :url
  ]

  @object_name "supersim.v1.esim_profile"
  def object_name, do: @object_name

  @sid_prefix "HP"
  def sid_prefix, do: @sid_prefix
end
