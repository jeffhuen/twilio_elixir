# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.Event do
  @moduledoc """
  API and webhook requests and responses. Contains parameters and TwiML for application control.

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `request` | Contains a dictionary representing the request of the call.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `response` | Contains a dictionary representing the call response, including a list of the call events.. PII: sensitive |
  """

  @type t :: %__MODULE__{
          request: String.t() | nil,
          response: String.t() | nil
        }

  defstruct [:request, :response]

  @object_name "api.v2010.account.call.call_event"
  def object_name, do: @object_name
end
