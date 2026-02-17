# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Function.Version.Content do
  @moduledoc """
  The code of a Function Version.

  SID prefix: `ZN`

  Parent: `/Services/{ServiceSid}/Functions/{FunctionSid}/Versions/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Function Version resource. |
  | `content` | The content of the Function Version resource. |
  | `function_sid` | The SID of the Function that is the parent of the Function Version. |
  | `service_sid` | The SID of the Service that the Function Version resource is associated with. |
  | `sid` | The unique string that we created to identify the Function Version resource. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          content: String.t() | nil,
          function_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :content, :function_sid, :service_sid, :sid, :url]

  @object_name "serverless.v1.service.function.function_version.function_version_content"
  def object_name, do: @object_name

  @sid_prefix "ZN"
  def sid_prefix, do: @sid_prefix
end
