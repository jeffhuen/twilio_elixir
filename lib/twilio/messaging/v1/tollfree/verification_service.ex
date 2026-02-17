# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Tollfree.VerificationService do
  @moduledoc """
  A Messaging resource to create and retrieve Tollfree Verifications.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List tollfree verifications

  Operation: `ListTollfreeVerification` | Tags: MessagingV1TollfreeVerification

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TollfreePhoneNumberSid` | string | The SID of the Phone Number associated with the Tollfree Verification. |
  | `Status` | string | The compliance status of the Tollfree Verification record. |
  | `ExternalReferenceId` | string | Customer supplied reference id for the Tollfree Verification record. |
  | `IncludeSubAccounts` | boolean | Whether to include Tollfree Verifications from sub accounts in list response. |
  | `TrustProductSid` | array | The trust product sids / tollfree bundle sids of tollfree verifications |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Tollfree/Verifications",
           params: params,
           opts: opts,
           base_url: "https://messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "verifications")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Messaging.V1.Tollfree.Verification
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List tollfree verifications (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "verifications"
    )
  end

  @doc """
  Create a tollfree verification

  Operation: `CreateTollfreeVerification` | Tags: MessagingV1TollfreeVerification

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BusinessName` | string | The name of the business or organization using the Tollfree number. |
  | `BusinessWebsite` | string | The website of the business or organization using the Tollfree number. |
  | `MessageVolume` | string | Estimate monthly volume of messages from the Tollfree Number. |
  | `NotificationEmail` | string | The email address to receive the notification about the verification result. . |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInImageUrls` | array | Link to an image that shows the opt-in workflow. Multiple images allowed and must be a publicly hosted URL. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInType` | string |  Values: `VERBAL`, `WEB_FORM`, `PAPER_FORM`, `VIA_TEXT`, `MOBILE_QR_CODE`, `IMPORT`, `IMPORT_PLEASE_REPLACE` |
  | `ProductionMessageSample` | string | An example of message content, i.e. a sample message. |
  | `TollfreePhoneNumberSid` | string | The SID of the Phone Number associated with the Tollfree Verification. |
  | `UseCaseCategories` | array | The category of the use case for the Tollfree Number. List as many are applicable.. |
  | `UseCaseSummary` | string | Use this to further explain how messaging is used by the business or organization. |
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
  | `BusinessContactPhone` | string (phone-number) | The E.164 formatted phone number of the contact for the business or organization using the Tollfree number. |
  | `BusinessCountry` | string | The country of the business or organization using the Tollfree number. |
  | `BusinessPostalCode` | string | The postal code of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessRegistrationAuthority` | string | The organizational authority for business registrations. Required for all business types except SOLE_PROPRIETOR. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessRegistrationCountry` | string | The country where the business is registered. Required for all business types except SOLE_PROPRIETOR. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessRegistrationNumber` | string | A legally recognized business registration number. Required for all business types except SOLE_PROPRIETOR. |
  | `BusinessRegistrationPhoneNumber` | string | The E.164 formatted number associated with the business. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessStateProvinceRegion` | string | The state/province/region of the business or organization using the Tollfree number. |
  | `BusinessStreetAddress` | string | The address of the business or organization using the Tollfree number. |
  | `BusinessStreetAddress2` | string | The address of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessType` | string | The type of business, valid values are PRIVATE_PROFIT, PUBLIC_PROFIT, NON_PROFIT, SOLE_PROPRIETOR, GOVERNMENT. Required field. |
  | `CustomerProfileSid` | string | Customer's Profile Bundle BundleSid. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DoingBusinessAs` | string | Trade name, sub entity, or downstream business name of business being submitted for verification |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ExternalReferenceId` | string | An optional external reference ID supplied by customer and echoed back on status retrieval. |
  | `HelpMessageSample` | string | A sample help message provided to users. |
  | `OptInConfirmationMessage` | string | The confirmation message sent to users when they opt in to receive messages. |
  | `OptInKeywords` | array | List of keywords that users can text in to opt in to receive messages. |
  | `PrivacyPolicyUrl` | string | The URL to the privacy policy for the business or organization. |
  | `TermsAndConditionsUrl` | string | The URL to the terms and conditions for the business or organization. |
  | `VettingId` | string | The unique ID of the vetting |
  | `VettingProvider` | string |  Values: `CAMPAIGN_VERIFY` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Tollfree.Verification.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Tollfree/Verifications",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Tollfree.Verification)}
    end
  end

  @doc """
  Retrieve a tollfree verification

  Operation: `FetchTollfreeVerification` | Tags: MessagingV1TollfreeVerification
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Tollfree.Verification.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Tollfree/Verifications/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Tollfree.Verification)}
    end
  end

  @doc """
  Edit a tollfree verification

  Operation: `UpdateTollfreeVerification` | Tags: MessagingV1TollfreeVerification

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
  | `BusinessContactPhone` | string (phone-number) | The E.164 formatted phone number of the contact for the business or organization using the Tollfree number. |
  | `BusinessCountry` | string | The country of the business or organization using the Tollfree number. |
  | `BusinessName` | string | The name of the business or organization using the Tollfree number. |
  | `BusinessPostalCode` | string | The postal code of the business or organization using the Tollfree number. |
  | `BusinessRegistrationAuthority` | string | The organizational authority for business registrations |
  | `BusinessRegistrationCountry` | string | Country business is registered in |
  | `BusinessRegistrationNumber` | string | A legaly recognized business registration number |
  | `BusinessRegistrationPhoneNumber` | string | The E.164 formatted number associated with the business. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessStateProvinceRegion` | string | The state/province/region of the business or organization using the Tollfree number. |
  | `BusinessStreetAddress` | string | The address of the business or organization using the Tollfree number. |
  | `BusinessStreetAddress2` | string | The address of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BusinessType` | string | The type of business, valid values are PRIVATE_PROFIT, PUBLIC_PROFIT, NON_PROFIT, SOLE_PROPRIETOR, GOVERNMENT |
  | `BusinessWebsite` | string | The website of the business or organization using the Tollfree number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DoingBusinessAs` | string | Trade name, sub entity, or downstream business name of business being submitted for verification |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EditReason` | string | Describe why the verification is being edited. If the verification was rejected because of a technical issue, such as the website being down, and the issue has been resolved this parameter should be set to something similar to 'Website fixed'. |
  | `HelpMessageSample` | string | A sample help message provided to users. |
  | `MessageVolume` | string | Estimate monthly volume of messages from the Tollfree Number. |
  | `NotificationEmail` | string | The email address to receive the notification about the verification result. . |
  | `OptInConfirmationMessage` | string | The confirmation message sent to users when they opt in to receive messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInImageUrls` | array | Link to an image that shows the opt-in workflow. Multiple images allowed and must be a publicly hosted URL. |
  | `OptInKeywords` | array | List of keywords that users can text in to opt in to receive messages. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OptInType` | string |  Values: `VERBAL`, `WEB_FORM`, `PAPER_FORM`, `VIA_TEXT`, `MOBILE_QR_CODE`, `IMPORT`, `IMPORT_PLEASE_REPLACE` |
  | `PrivacyPolicyUrl` | string | The URL to the privacy policy for the business or organization. |
  | `ProductionMessageSample` | string | An example of message content, i.e. a sample message. |
  | `TermsAndConditionsUrl` | string | The URL to the terms and conditions for the business or organization. |
  | `UseCaseCategories` | array | The category of the use case for the Tollfree Number. List as many are applicable.. |
  | `UseCaseSummary` | string | Use this to further explain how messaging is used by the business or organization. |
  | `VettingId` | string | The unique ID of the vetting |
  | `VettingProvider` | string |  Values: `CAMPAIGN_VERIFY` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Tollfree.Verification.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Tollfree/Verifications/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Tollfree.Verification)}
    end
  end

  @doc """
  Delete a tollfree verification

  Operation: `DeleteTollfreeVerification` | Tags: MessagingV1TollfreeVerification
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Tollfree/Verifications/#{sid}",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
