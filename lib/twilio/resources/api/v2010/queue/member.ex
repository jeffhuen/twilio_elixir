# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Queue.Member do
  @moduledoc """
  Calls in a call queue

  Parent: `/Accounts/{AccountSid}/Queues/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Member resource is associated with. |
  | `date_enqueued` | The date that the member was enqueued, given in RFC 2822 format.. Format: date-time-rfc-2822 |
  | `position` | This member's current position in the queue. |
  | `queue_sid` | The SID of the Queue the member is in. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  | `wait_time` | The number of seconds the member has been in the queue. |
  """

  @type t :: %__MODULE__{
          call_sid: String.t() | nil,
          date_enqueued: String.t() | nil,
          position: integer(),
          queue_sid: String.t() | nil,
          uri: String.t() | nil,
          wait_time: integer()
        }

  defstruct [:call_sid, :date_enqueued, :position, :queue_sid, :uri, :wait_time]

  @object_name "api.v2010.account.queue.member"
  def object_name, do: @object_name
end
