# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V2.Channel.Sender do
  @moduledoc """
  The Senders resource represents a messaging channel sender (WhatsApp, RCS).

  SID prefix: `XE`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `sid` | The SID of the sender. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the sender. . Values: `CREATING`, `ONLINE`, `OFFLINE`, `PENDING_VERIFICATION`, `VERIFYING`, `ONLINE:UPDATING`, `TWILIO_REVIEW`, `DRAFT`, `STUBBED` |
  | `url` | The URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          compliance: String.t(),
          configuration: String.t(),
          offline_reasons: String.t(),
          profile: String.t(),
          properties: String.t(),
          sender_id: String.t(),
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil,
          webhook: String.t()
        }

  defstruct [
    :compliance,
    :configuration,
    :offline_reasons,
    :profile,
    :properties,
    :sender_id,
    :sid,
    :status,
    :url,
    :webhook
  ]

  @object_name "messaging.v2.channels_sender_response"
  def object_name, do: @object_name

  @sid_prefix "XE"
  def sid_prefix, do: @sid_prefix
end
