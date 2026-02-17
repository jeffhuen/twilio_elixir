# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Function.Version do
  @moduledoc """
  The content of a Function.

  SID prefix: `ZN`

  Parent: `/Services/{ServiceSid}/Functions/{Sid}`

  ## Sub-resources
  - `function_version_content` — `/v1/Services/{service_sid}/Functions/{function_sid}/Versions/{sid}/Content`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Function Version resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Function Version resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `function_sid` | The SID of the Function resource that is the parent of the Function Version resource. |
  | `links` | Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `path` | The URL-friendly string by which the Function Version resource can be referenced. It can be a maximum of 255 characters. All paths begin with a forward slash ('/'). If a Function Version creation request is submitted with a path not containing a leading slash, the path will automatically be prepended with one.. PII: standard |
  | `service_sid` | The SID of the Service that the Function Version resource is associated with. |
  | `sid` | The unique string that we created to identify the Function Version resource. |
  | `url` | The absolute URL of the Function Version resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `visibility` | The access control that determines how the Function Version resource can be accessed. Can be: `public`, `protected`, or `private`.. Values: `public`, `private`, `protected` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          function_sid: String.t() | nil,
          links: map() | nil,
          path: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          visibility: String.t()
        }

  defstruct [
    :account_sid,
    :date_created,
    :function_sid,
    :links,
    :path,
    :service_sid,
    :sid,
    :url,
    :visibility
  ]

  @object_name "serverless.v1.service.function.function_version"
  def object_name, do: @object_name

  @sid_prefix "ZN"
  def sid_prefix, do: @sid_prefix
end
