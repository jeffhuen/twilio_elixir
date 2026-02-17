# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Flexflow do
  @moduledoc """
  Flex Flow

  SID prefix: `FO`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Flow resource and owns this Workflow. |
  | `channel_type` | The channel type. One of `web`, `facebook`, `sms`, `whatsapp`, `line` or `custom`. By default, Studio’s Send to Flex widget passes it on to the Task attributes for Tasks created based on this Flex Flow. The Task attributes will be used by the Flex UI to render the respective Task as appropriate (applying channel-specific design and length limits). If `channelType` is `facebook`, `whatsapp` or `line`, the Send to Flex widget should set the Task Channel to Programmable Chat.. Values: `web`, `sms`, `facebook`, `whatsapp`, `line`, `custom` |
  | `chat_service_sid` | The SID of the chat service. |
  | `contact_identity` | The channel contact's Identity. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `enabled` | Whether the Flex Flow is enabled. |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `integration` | An object that contains specific parameters for the integration. |
  | `integration_type` | The software that will handle inbound messages. [Integration Type](https://www.twilio.com/docs/flex/developer/messaging/manage-flows#integration-types) can be: `studio`, `external`,  or `task`.. Values: `studio`, `external`, `task` |
  | `janitor_enabled` | When enabled, the Messaging Channel Janitor will remove active Proxy sessions if the associated Task is deleted outside of the Flex UI. Defaults to `false`. |
  | `long_lived` | When enabled, Flex will keep the chat channel active so that it may be used for subsequent interactions with a contact identity. Defaults to `false`. |
  | `sid` | The unique string that we created to identify the Flex Flow resource. |
  | `url` | The absolute URL of the Flex Flow resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_type: String.t(),
          chat_service_sid: String.t() | nil,
          contact_identity: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          integration: String.t() | nil,
          integration_type: String.t(),
          janitor_enabled: boolean() | nil,
          long_lived: boolean() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_type,
    :chat_service_sid,
    :contact_identity,
    :date_created,
    :date_updated,
    :enabled,
    :friendly_name,
    :integration,
    :integration_type,
    :janitor_enabled,
    :long_lived,
    :sid,
    :url
  ]

  @object_name "flex.v1.flex_flow"
  def object_name, do: @object_name

  @sid_prefix "FO"
  def sid_prefix, do: @sid_prefix
end
