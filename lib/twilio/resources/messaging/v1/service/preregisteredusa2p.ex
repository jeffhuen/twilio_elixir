# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Preregisteredusa2p do
  @moduledoc """
  Resource to associate preregistered campaign with Messaging Service.

  SID prefix: `QE`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Campaign belongs to. |
  | `campaign_id` | ID of the preregistered campaign. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `messaging_service_sid` | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) that the resource is associated with. |
  | `sid` | The unique string that identifies a US A2P Compliance resource `QE2c6890da8086d771620e9b13fadeba0b`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          campaign_id: String.t() | nil,
          date_created: String.t() | nil,
          messaging_service_sid: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:account_sid, :campaign_id, :date_created, :messaging_service_sid, :sid]

  @object_name "messaging.v1.external_campaign"
  def object_name, do: @object_name

  @sid_prefix "QE"
  def sid_prefix, do: @sid_prefix
end
