# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.UserDefinedMessageSubscription do
  @moduledoc """
  Subscription for server-side application access to messages sent from the Voice SDK for an active Call.

  SID prefix: `ZY`

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that subscribed to the User Defined Messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message Subscription is associated with. This refers to the Call SID that is producing the User Defined Messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date that this User Defined Message Subscription was created, given in RFC 2822 format.. Format: date-time-rfc-2822 |
  | `sid` | The SID that uniquely identifies this User Defined Message Subscription. |
  | `uri` | The URI of the User Defined Message Subscription Resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          date_created: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:account_sid, :call_sid, :date_created, :sid, :uri]

  @object_name "api.v2010.account.call.user_defined_message_subscription"
  def object_name, do: @object_name

  @sid_prefix "ZY"
  def sid_prefix, do: @sid_prefix
end
