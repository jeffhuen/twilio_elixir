# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Message.Media do
  @moduledoc """
  The Media subresource of a Message resource represents a piece of media, such as an image, that is associated with the Message.

  SID prefix: `ME`

  Parent: `/Accounts/{AccountSid}/Messages/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with this Media resource. |
  | `content_type` | The default [MIME type](https://en.wikipedia.org/wiki/Internet_media_type) of the media, for example `image/jpeg`, `image/png`, or `image/gif`. |
  | `date_created` | The date and time in GMT when this Media resource was created, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT when this Media resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `parent_sid` | The SID of the Message resource that is associated with this Media resource. |
  | `sid` | The unique string that identifies this Media resource. |
  | `uri` | The URI of this Media resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          content_type: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          parent_sid: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:account_sid, :content_type, :date_created, :date_updated, :parent_sid, :sid, :uri]

  @object_name "api.v2010.account.message.media"
  def object_name, do: @object_name

  @sid_prefix "ME"
  def sid_prefix, do: @sid_prefix
end
