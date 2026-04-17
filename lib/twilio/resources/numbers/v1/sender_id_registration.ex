# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.SenderIdRegistration do
  @moduledoc """
  Create a Sender ID Registration and initialize an embedded session

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `comments` | Additional comments. |
  | `data` | Registration data echoed from the request. |
  | `dateCreated` | Timestamp of creation.. Format: date-time |
  | `dateUpdated` | Timestamp of last update.. Format: date-time |
  | `friendlyName` | The friendly name provided in the request. |
  | `id` | Registration identifier (BU-prefixed). |
  | `regulationId` | The regulation ID for this registration. |
  | `regulationVersion` | The regulation version. |
  | `status` | Registration status. Always DRAFT on creation. |
  | `statusCallbackUrl` | Callback URL for status webhooks. |
  | `statusNotificationEmail` | Email address for status notifications.. Format: email |
  """

  @type t :: %__MODULE__{
          comments: String.t() | nil,
          data: map(),
          dateCreated: String.t(),
          dateUpdated: String.t(),
          embeddedSession: String.t(),
          friendlyName: String.t(),
          id: String.t(),
          regulationId: String.t(),
          regulationVersion: integer(),
          status: String.t(),
          statusCallbackUrl: String.t() | nil,
          statusNotificationEmail: String.t() | nil
        }

  defstruct [
    :comments,
    :data,
    :dateCreated,
    :dateUpdated,
    :embeddedSession,
    :friendlyName,
    :id,
    :regulationId,
    :regulationVersion,
    :status,
    :statusCallbackUrl,
    :statusNotificationEmail
  ]

  @object_name "numbers.v1.create_embedded_registration_response"
  def object_name, do: @object_name
end
