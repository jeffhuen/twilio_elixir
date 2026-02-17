# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.Complianceinquiry.Registration.Regulatorycompliance.Gb.ComplianceRegistrationInquiriesService do
  @moduledoc """


  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Resume a specific Regulatory Compliance Inquiry that has expired, or re-open a rejected Compliance Inquiry for editing.

  Operation: `UpdateComplianceRegistration` | Tags: TrusthubV1ComplianceRegistrationInquiries

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IsIsvEmbed` | boolean | Indicates if the inquiry is being started from an ISV embedded component. |
  | `ThemeSetId` | string | Theme id for styling the inquiry form. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok,
           Twilio.Resources.Trusthub.V1.Complianceinquiry.Registration.Regulatorycompliance.Gb.ComplianceRegistrationInquiries.t()}
          | {:error, Twilio.Error.t()}
  def update(client, registration_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/ComplianceInquiries/Registration/#{registration_id}/RegulatoryCompliance/GB/Initialize",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Complianceinquiry.Registration.Regulatorycompliance.Gb.ComplianceRegistrationInquiries
       )}
    end
  end
end
