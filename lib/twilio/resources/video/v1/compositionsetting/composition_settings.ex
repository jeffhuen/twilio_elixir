# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Compositionsetting.CompositionSettings do
  @moduledoc """
  Recording composition settings

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the CompositionSettings resource. |
  | `aws_credentials_sid` | The SID of the stored Credential resource. |
  | `aws_s3_url` | The URL of the AWS S3 bucket where the compositions are stored. We only support DNS-compliant URLs like `https://documentation-example-twilio-bucket/compositions`, where `compositions` is the path in which you want the compositions to be stored. This URL accepts only URI-valid characters, as described in the [RFC 3986](https://tools.ietf.org/html/rfc3986#section-2).. Format: uri |
  | `aws_storage_enabled` | Whether all compositions are written to the `aws_s3_url`. When `false`, all compositions are stored in our cloud. |
  | `encryption_enabled` | Whether all compositions are stored in an encrypted form. The default is `false`. |
  | `encryption_key_sid` | The SID of the Public Key resource used for encryption. |
  | `friendly_name` | The string that you assigned to describe the resource and that will be shown in the console |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          aws_credentials_sid: String.t() | nil,
          aws_s3_url: String.t() | nil,
          aws_storage_enabled: boolean() | nil,
          encryption_enabled: boolean() | nil,
          encryption_key_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :aws_credentials_sid,
    :aws_s3_url,
    :aws_storage_enabled,
    :encryption_enabled,
    :encryption_key_sid,
    :friendly_name,
    :url
  ]

  @object_name "video.v1.composition_settings"
  def object_name, do: @object_name
end
