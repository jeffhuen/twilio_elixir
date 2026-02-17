# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Message.Feedback do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  The MessageFeedback subresource of a Message resource. MessageFeedback contains the reported outcome of whether the Message recipient performed a tracked user action.

  Parent: `/Accounts/{AccountSid}/Messages/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with this MessageFeedback resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when this MessageFeedback resource was created, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when this MessageFeedback resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `message_sid` | The SID of the Message resource associated with this MessageFeedback resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `outcome` | Reported outcome indicating whether there is confirmation that the Message recipient performed a tracked user action. Can be: `unconfirmed` or `confirmed`. For more details see [How to Optimize Message Deliverability with Message Feedback](https://www.twilio.com/docs/messaging/guides/send-message-feedback-to-twilio).. Values: `confirmed`, `unconfirmed` |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          message_sid: String.t() | nil,
          outcome: String.t(),
          uri: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :message_sid, :outcome, :uri]

  @object_name "api.v2010.account.message.message_feedback"
  def object_name, do: @object_name
end
