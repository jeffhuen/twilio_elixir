# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Accesstoken do
  @moduledoc """


  SID prefix: `YK`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `date_created` | The date that this access token was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `entity_identity` | The unique external identifier for the Entity of the Service. |
  | `factor_friendly_name` | A human readable description of this factor, up to 64 characters. For a push factor, this can be the device's name.. PII: standard |
  | `factor_type` | The Type of the Factor. Currently only `push` is supported.. Values: `push` |
  | `service_sid` | The unique SID identifier of the Verify Service. |
  | `sid` | A 34 character string that uniquely identifies this Access Token. |
  | `token` | The access token generated for enrollment, this is an encrypted json web token. |
  | `ttl` | How long, in seconds, the access token is valid. Max: 5 minutes |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          entity_identity: String.t() | nil,
          factor_friendly_name: String.t() | nil,
          factor_type: String.t(),
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          token: String.t() | nil,
          ttl: integer(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :entity_identity,
    :factor_friendly_name,
    :factor_type,
    :service_sid,
    :sid,
    :token,
    :ttl,
    :url
  ]

  @object_name "verify.v2.service.access_token"
  def object_name, do: @object_name

  @sid_prefix "YK"
  def sid_prefix, do: @sid_prefix
end
