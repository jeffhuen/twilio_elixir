# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V2.Instance.User do
  @moduledoc """
  User resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID of the account that created the resource. |
  | `created_date` | The date that this user was created, given in ISO 8601 format.. Format: date-time |
  | `email` | Email of the User. |
  | `flex_team_sid` | The unique SID identifier of the Flex Team. |
  | `flex_user_sid` | The unique SID identifier of the Flex User. |
  | `instance_sid` | The unique ID created by Twilio to identify a Flex instance. |
  | `locale` | The locale preference of the user. |
  | `roles` | The roles of the user. |
  | `updated_date` | The date that this user was updated, given in ISO 8601 format.. Format: date-time |
  | `url` | Format: uri |
  | `user_sid` | The unique SID identifier of the Twilio Unified User. |
  | `username` | Username of the User. |
  | `version` | The current version of the user. |
  | `worker_sid` | The unique SID identifier of the worker. |
  | `workspace_sid` | The unique SID identifier of the workspace. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          created_date: String.t() | nil,
          email: String.t() | nil,
          flex_team_sid: String.t() | nil,
          flex_user_sid: String.t() | nil,
          instance_sid: String.t() | nil,
          locale: String.t() | nil,
          roles: list() | nil,
          updated_date: String.t() | nil,
          url: String.t() | nil,
          user_sid: String.t() | nil,
          username: String.t() | nil,
          version: integer(),
          worker_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :created_date,
    :email,
    :flex_team_sid,
    :flex_user_sid,
    :instance_sid,
    :locale,
    :roles,
    :updated_date,
    :url,
    :user_sid,
    :username,
    :version,
    :worker_sid,
    :workspace_sid
  ]

  @object_name "flex.v2.flex_user"
  def object_name, do: @object_name
end
