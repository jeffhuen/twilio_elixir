# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.VerificationCheckService do
  @moduledoc """
  Service for VerificationCheck API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  challenge a specific Verification Check.

  Operation: `CreateVerificationCheck` | Tags: VerifyV2VerificationCheck

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Amount` | string | The amount of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled. |
  | `Code` | string | The 4-10 character string being verified. |
  | `Payee` | string | The payee of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SnaClientToken` | string | A sna client token received in sna url invocation response needs to be passed in Verification Check request and should match to get successful response. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `To` | string | The phone number or [email](https://www.twilio.com/docs/verify/email) to verify. Either this parameter or the `verification_sid` must be specified. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationSid` | string | A SID that uniquely identifies the Verification Check. Either this parameter or the `to` phone number/[email](https://www.twilio.com/docs/verify/email) must be specified. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.VerificationCheck.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/VerificationCheck",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.VerificationCheck)}
    end
  end
end
