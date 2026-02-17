# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Passkey.ApprovechallengeService do
  @moduledoc """
  Service for Approvechallenge API operations.

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  Approve a Passkeys challenge

  Operation: `UpdateChallengePasskeys`

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `authenticatorAttachment` | string | A string that indicates the mechanism by which the WebAuthn implementation is attached to the authenticator at the time the associated `navigator.credentials.create()` or `navigator.credentials.get()` call completes. Values: `platform`, `cross-platform` |
  | `id` | string | A [base64url](https://base64.guru/standards/base64url) encoded representation of `rawId`. |
  | `rawId` | string | The globally unique identifier for this `PublicKeyCredential`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `response` | object | The result of a WebAuthn authentication via a `navigator.credentials.get()` request, as specified in [AuthenticatorAttestationResponse](https://developer.mozilla.org/en-US/docs/Web/API/AuthenticatorAttestationResponse). |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | string | The valid credential types supported by the API. The values of this enumeration are used for versioning the `AuthenticatorAssertion` and `AuthenticatorAttestation` structures according to the type of the authenticator. Values: `public-key` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v2/Services/#{service_sid}/Passkeys/ApproveChallenge",
      params: params,
      opts: opts,
      base_url: "https://verify.twilio.com",
      content_type: :json
    )
  end
end
