# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V2.Voice.Report.PhoneNumber.Inbound do
  @moduledoc """
  Inbound Report resource for Voice Insights Phone Numbers Level

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `report_id` | The report identifier as Voice Insights Report TTID. |
  | `status` | The status of the report.. Values: `created`, `running`, `completed` |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          report_id: String.t(),
          request_meta: String.t(),
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [:account_sid, :report_id, :request_meta, :status, :url]

  @object_name "insights.v2.create_report_response"
  def object_name, do: @object_name
end
