# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Asset.Version do
  @moduledoc """
  The content of an Asset.

  SID prefix: `ZN`

  Parent: `/Services/{ServiceSid}/Assets/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Asset Version resource. |
  | `asset_sid` | The SID of the Asset resource that is the parent of the Asset Version. |
  | `date_created` | The date and time in GMT when the Asset Version resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `path` | The URL-friendly string by which the Asset Version can be referenced. It can be a maximum of 255 characters. All paths begin with a forward slash ('/'). If an Asset Version creation request is submitted with a path not containing a leading slash, the path will automatically be prepended with one.. PII: standard |
  | `service_sid` | The SID of the Service that the Asset Version resource is associated with. |
  | `sid` | The unique string that we created to identify the Asset Version resource. |
  | `url` | The absolute URL of the Asset Version resource.. Format: uri |
  | `visibility` | The access control that determines how the Asset Version resource can be accessed. Can be:  `public`, `protected`, or `private`.. Values: `public`, `private`, `protected` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          asset_sid: String.t() | nil,
          date_created: String.t() | nil,
          path: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          visibility: String.t()
        }

  defstruct [
    :account_sid,
    :asset_sid,
    :date_created,
    :path,
    :service_sid,
    :sid,
    :url,
    :visibility
  ]

  @object_name "serverless.v1.service.asset.asset_version"
  def object_name, do: @object_name

  @sid_prefix "ZN"
  def sid_prefix, do: @sid_prefix
end
