# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Wireless.Command do
  @moduledoc """


  SID prefix: `DC`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          command: String.t() | nil,
          command_mode: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          device_sid: String.t() | nil,
          direction: String.t() | nil,
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          status: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :command,
    :command_mode,
    :date_created,
    :date_updated,
    :device_sid,
    :direction,
    :sid,
    :sim_sid,
    :status,
    :url
  ]

  @object_name "preview.wireless.command"
  def object_name, do: @object_name

  @sid_prefix "DC"
  def sid_prefix, do: @sid_prefix
end
