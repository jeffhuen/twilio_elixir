# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Iam.V1.Token do
  @moduledoc """
  Token resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `access_token` | Token which carries the necessary information to access a Twilio resource directly. |
  | `expires_in` | Format: int64 |
  | `id_token` | Token which carries the information necessary of user profile. |
  | `refresh_token` | Token which carries the information necessary to get a new access token. |
  | `token_type` | Token type |
  """

  @type t :: %__MODULE__{
          access_token: String.t() | nil,
          expires_in: integer() | nil,
          id_token: String.t() | nil,
          refresh_token: String.t() | nil,
          token_type: String.t() | nil
        }

  defstruct [:access_token, :expires_in, :id_token, :refresh_token, :token_type]

  @object_name "oauth.v1.token"
  def object_name, do: @object_name
end
