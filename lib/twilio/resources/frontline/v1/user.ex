# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Frontline.V1.User do
  @moduledoc """
  A User resource represents a frontline user.

  SID prefix: `US`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `avatar` | The avatar URL which will be shown in Frontline application. |
  | `friendly_name` | The string that you assigned to describe the User.. PII: standard |
  | `identity` | The application-defined string that uniquely identifies the resource's User. This value is often a username or an email address, and is case-sensitive.. PII: standard |
  | `is_available` | Whether the User is available for new conversations. Defaults to `false` for new users. |
  | `sid` | The unique string that we created to identify the User resource. |
  | `state` | Current state of this user. Can be either `active` or `deactivated` and defaults to `active`. Values: `active`, `deactivated` |
  | `url` | An absolute API resource URL for this user.. Format: uri |
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          friendly_name: String.t() | nil,
          identity: String.t() | nil,
          is_available: boolean() | nil,
          sid: String.t() | nil,
          state: String.t(),
          url: String.t() | nil
        }

  defstruct [:avatar, :friendly_name, :identity, :is_available, :sid, :state, :url]

  @object_name "frontline.v1.user"
  def object_name, do: @object_name

  @sid_prefix "US"
  def sid_prefix, do: @sid_prefix
end
