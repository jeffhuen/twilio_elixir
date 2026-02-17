# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Build.Status do
  @moduledoc """
  The status of a Build resource.

  SID prefix: `ZB`

  Parent: `/Services/{ServiceSid}/Builds/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Build resource. |
  | `service_sid` | The SID of the Service that the Build resource is associated with. |
  | `sid` | The unique string that we created to identify the Build resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Build. Can be: `building`, `completed`, or `failed`.. Values: `building`, `completed`, `failed` |
  | `url` | The absolute URL of the Build Status resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [:account_sid, :service_sid, :sid, :status, :url]

  @object_name "serverless.v1.service.build.build_status"
  def object_name, do: @object_name

  @sid_prefix "ZB"
  def sid_prefix, do: @sid_prefix
end
