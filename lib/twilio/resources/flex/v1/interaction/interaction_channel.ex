# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Interaction.InteractionChannel do
  @moduledoc """
  InteractionChannel resource.

  SID prefix: `UO`

  Parent: `/Interactions/{Sid}`

  ## Sub-resources
  - `invites` — `/v1/Interactions/{interaction_sid}/Channels/{channel_sid}/Invites`
  - `participants` — `/v1/Interactions/{interaction_sid}/Channels/{channel_sid}/Participants`
  - `transfers` — `/v1/Interactions/{interaction_sid}/Channels/{channel_sid}/Transfers`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `error_code` | The Twilio error code for a failed channel. |
  | `error_message` | The error message for a failed channel. |
  | `interaction_sid` | The unique string created by Twilio to identify an Interaction resource, prefixed with KD. |
  | `links` | Format: uri-map |
  | `sid` | The unique string created by Twilio to identify an Interaction Channel resource, prefixed with UO. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of this channel.. Values: `setup`, `active`, `failed`, `closed`, `inactive`, `pause`, `transfer` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | The Interaction Channel's type. Can be: `sms`, `email`, `chat`, `whatsapp`, `web`, `messenger`, or `gbm`.   **Note:** These can be different from the task channel type specified in the Routing attributes. Task channel type corresponds to channel capacity while this channel type is the actual media type. Values: `voice`, `sms`, `email`, `web`, `whatsapp`, `chat`, `messenger`, `gbm` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          error_code: integer() | nil,
          error_message: String.t() | nil,
          interaction_sid: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          status: String.t(),
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [:error_code, :error_message, :interaction_sid, :links, :sid, :status, :type, :url]

  @object_name "flex.v1.interaction.interaction_channel"
  def object_name, do: @object_name

  @sid_prefix "UO"
  def sid_prefix, do: @sid_prefix
end
