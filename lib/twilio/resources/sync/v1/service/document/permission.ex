# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.Document.Permission do
  @moduledoc """
  Sync document permissions

  Parent: `/Services/{ServiceSid}/Documents/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Document Permission resource. |
  | `document_sid` | The SID of the Sync Document to which the Document Permission applies. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity` | The application-defined string that uniquely identifies the resource's User within the Service to an FPA token.. PII: standard |
  | `manage` | Whether the identity can delete the Sync Document. |
  | `read` | Whether the identity can read the Sync Document. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `url` | The absolute URL of the Sync Document Permission resource.. Format: uri |
  | `write` | Whether the identity can update the Sync Document. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          document_sid: String.t() | nil,
          identity: String.t() | nil,
          manage: boolean() | nil,
          read: boolean() | nil,
          service_sid: String.t() | nil,
          url: String.t() | nil,
          write: boolean() | nil
        }

  defstruct [:account_sid, :document_sid, :identity, :manage, :read, :service_sid, :url, :write]

  @object_name "sync.v1.service.document.document_permission"
  def object_name, do: @object_name
end
