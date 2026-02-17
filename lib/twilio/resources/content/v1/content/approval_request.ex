# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Content.V1.Content.ApprovalRequest do
  @moduledoc """
  An Approval Fetch resource represents the approval status of a Content resource.

  SID prefix: `HX`

  Parent: `/Content/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/usage/api/account) that created Content resource. |
  | `sid` | The unique string that that we created to identify the Content resource. |
  | `url` | The URL of the resource, relative to `https://content.twilio.com`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `whatsapp` | Contains the whatsapp approval information for the Content resource, with fields such as approval status, rejection reason, and category, amongst others. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          whatsapp: map() | nil
        }

  defstruct [:account_sid, :sid, :url, :whatsapp]

  @object_name "content.v1.content.approval_fetch"
  def object_name, do: @object_name

  @sid_prefix "HX"
  def sid_prefix, do: @sid_prefix
end
