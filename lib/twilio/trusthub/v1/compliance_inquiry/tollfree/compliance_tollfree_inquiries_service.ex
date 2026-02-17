# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.ComplianceInquiry.Tollfree.ComplianceTollfreeInquiriesService do
  @moduledoc """
  Service for ComplianceTollfreeInquiries API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create a new Compliance Tollfree Verification Inquiry for the authenticated account. This is necessary to start a new embedded session.

  Operation: `CreateComplianceTollfreeInquiry` | Tags: TrusthubV1ComplianceTollfreeInquiries

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `NotificationEmail` | string | The email address to receive the notification about the verification result. |
  | `TollfreePhoneNumber` | string (phone-number) | The Tollfree phone number to be verified |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AdditionalInformation` | string | Additional information to be provided for verification. |
  | `AgeGatedContent` | boolean | Indicates if the content is age gated. |
  | `BusinessCity` | string | The city of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessContactEmail` | string | The email address of the contact for the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessContactFirstName` | string | The first name of the contact for the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessContactLastName` | string | The last name of the contact for the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessContactPhone` | string (phone-number) | The phone number of the contact for the business or organization using the Tollfree number. |
  | `BusinessCountry` | string | The country of the business or organization using the Tollfree number. |
  | `BusinessName` | string | The name of the business or organization using the Tollfree number. |
  | `BusinessPostalCode` | string | The postal code of the business or organization using the Tollfree number. |
  | `BusinessRegistrationAuthority` | string | The Business Registration Authority of the business or organization. |
  | `BusinessRegistrationCountry` | string | The Business Registration Country of the business or organization. |
  | `BusinessRegistrationNumber` | string | The Business Registration Number of the business or organization. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessStateProvinceRegion` | string | The state/province/region of the business or organization using the Tollfree number. |
  | `BusinessStreetAddress` | string | The address of the business or organization using the Tollfree number. |
  | `BusinessStreetAddress2` | string | The address of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessType` | string |  Values: `PRIVATE_PROFIT`, `PUBLIC_PROFIT`, `NON_PROFIT`, `SOLE_PROPRIETOR`, `GOVERNMENT` |
  | `BusinessWebsite` | string | The website of the business or organization using the Tollfree number. |
  | `CustomerProfileSid` | string | The Customer Profile Sid associated with the Account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DoingBusinessAs` | string | Trade name, sub entity, or downstream business name of business being submitted for verification. |
  | `ExternalReferenceId` | string | A legally recognized business registration number. |
  | `HelpMessageSample` | string | A sample help message provided to users. |
  | `MessageVolume` | string | Estimate monthly volume of messages from the Tollfree Number. |
  | `OptInConfirmationMessage` | string | The confirmation message sent to users when they opt in to receive messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInImageUrls` | array | Link to an image that shows the opt-in workflow. Multiple images allowed and must be a publicly hosted URL. |
  | `OptInKeywords` | array | List of keywords that users can text in to opt in to receive messages. |
  | `OptInType` | string |  Values: `VERBAL`, `WEB_FORM`, `PAPER_FORM`, `VIA_TEXT`, `MOBILE_QR_CODE` |
  | `PrivacyPolicyUrl` | string | The URL to the privacy policy for the business or organization. |
  | `ProductionMessageSample` | string | An example of message content, i.e. a sample message. |
  | `SkipMessagingUseCase` | boolean | Skip the messaging use case screen of the inquiry form. |
  | `TermsAndConditionsUrl` | string | The URL to the terms and conditions for the business or organization. |
  | `ThemeSetId` | string | Theme id for styling the inquiry form. |
  | `UseCaseCategories` | array | The category of the use case for the Tollfree Number. List as many are applicable.. |
  | `UseCaseSummary` | string | Use this to further explain how messaging is used by the business or organization. |
  | `VettingId` | string | Unique identifier for the created Vetting . |
  | `VettingProvider` | string | Name of the vetting provider. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok,
           Twilio.Resources.Trusthub.V1.ComplianceInquiry.Tollfree.ComplianceTollfreeInquiries.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ComplianceInquiries/Tollfree/Initialize",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.ComplianceInquiry.Tollfree.ComplianceTollfreeInquiries
       )}
    end
  end
end
