# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.Complianceinquiry.Customer.ComplianceInquiries do
  @moduledoc """
  ComplianceInquiries resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `customer_id` | The CustomerID matching the Customer Profile that should be resumed or resubmitted for editing. |
  | `inquiry_id` | The unique ID used to start an embedded compliance registration session. |
  | `inquiry_session_token` | The session token used to start an embedded compliance registration session. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          customer_id: String.t() | nil,
          inquiry_id: String.t() | nil,
          inquiry_session_token: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:customer_id, :inquiry_id, :inquiry_session_token, :url]

  @object_name "trusthub.v1.compliance_inquiry"
  def object_name, do: @object_name
end
