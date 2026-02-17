# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.Channel.Invite do
  @moduledoc """
  Pending invitations to users to become channel members

  SID prefix: `IN`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Invite resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel_sid` | The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the Invite resource belongs to. |
  | `created_by` | The `identity` of the User that created the invite. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity` | The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.. PII: standard |
  | `role_sid` | The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) assigned to the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Invite resource is associated with. |
  | `sid` | The unique string that we created to identify the Invite resource. |
  | `url` | The absolute URL of the Invite resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          identity: String.t() | nil,
          role_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :created_by,
    :date_created,
    :date_updated,
    :identity,
    :role_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "chat.v2.service.channel.invite"
  def object_name, do: @object_name

  @sid_prefix "IN"
  def sid_prefix, do: @sid_prefix
end
