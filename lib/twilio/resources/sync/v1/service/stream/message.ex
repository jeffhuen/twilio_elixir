# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.Stream.Message do
  @moduledoc """


  SID prefix: `TZ`

  Parent: `/Services/{ServiceSid}/Streams/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `data` | An arbitrary, schema-less object that contains the Stream Message body. Can be up to 4 KiB in length.. PII: sensitive |
  | `sid` | The unique string that we created to identify the Stream Message resource. |
  """

  @type t :: %__MODULE__{
          data: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:data, :sid]

  @object_name "sync.v1.service.sync_stream.stream_message"
  def object_name, do: @object_name

  @sid_prefix "TZ"
  def sid_prefix, do: @sid_prefix
end
