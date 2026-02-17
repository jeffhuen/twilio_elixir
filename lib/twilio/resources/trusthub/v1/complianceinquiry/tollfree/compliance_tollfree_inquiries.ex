# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.Complianceinquiry.Tollfree.ComplianceTollfreeInquiries do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `inquiry_id` | The unique ID used to start an embedded compliance registration session. |
  | `inquiry_session_token` | The session token used to start an embedded compliance registration session. |
  | `registration_id` | The TolfreeId matching the Tollfree Profile that should be resumed or resubmitted for editing. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          inquiry_id: String.t() | nil,
          inquiry_session_token: String.t() | nil,
          registration_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:inquiry_id, :inquiry_session_token, :registration_id, :url]

  @object_name "trusthub.v1.compliance_tollfree_inquiry"
  def object_name, do: @object_name
end
