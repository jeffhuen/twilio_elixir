# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.Complianceinquiry.Customer.ComplianceInquiriesService do
  @moduledoc """


  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Resume a specific Compliance Inquiry that has expired, or re-open a rejected Compliance Inquiry for editing.

  Operation: `UpdateComplianceInquiry` | Tags: TrusthubV1ComplianceInquiries

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PrimaryProfileSid` | string | The unique SID identifier of the Primary Customer Profile that should be used as a parent. Only necessary when creating a secondary Customer Profile. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ThemeSetId` | string | Theme id for styling the inquiry form. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Complianceinquiry.Customer.ComplianceInquiries.t()}
          | {:error, Twilio.Error.t()}
  def update(client, customer_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/ComplianceInquiries/Customers/#{customer_id}/Initialize",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Complianceinquiry.Customer.ComplianceInquiries
       )}
    end
  end
end
