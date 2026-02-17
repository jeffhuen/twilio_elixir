# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Accounts.V1.Authtoken.Promote do
  @moduledoc """
  Auth Token promotion

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the secondary Auth Token was created for. |
  | `auth_token` | The promoted Auth Token that must be used to authenticate future API requests.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in UTC when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `url` | The URI for this resource, relative to `https://accounts.twilio.com`. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          auth_token: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :auth_token, :date_created, :date_updated, :url]

  @object_name "accounts.v1.auth_token_promotion"
  def object_name, do: @object_name
end
