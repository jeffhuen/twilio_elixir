# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V2.Voice.Report do
  @moduledoc """
  Report resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `report_id` | The account level report identifier as Voice Insights Report TTID. |
  | `status` | The status of the report.. Values: `created`, `running`, `completed` |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          report: String.t(),
          report_id: String.t(),
          request_meta: String.t(),
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [:account_sid, :report, :report_id, :request_meta, :status, :url]

  @object_name "insights.v2.account_report"
  def object_name, do: @object_name
end
