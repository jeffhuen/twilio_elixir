# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Passkey.ChallengeService do
  @moduledoc """
  Service for Challenge API operations.

  Operations: `update`
  """

  alias Twilio.Client

  @doc """
  Create a Passkeys Challenge

  Operation: `CreateChallengePasskeys` | Tags: VerifyV2NewChallenge

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `factor_sid` | string |  |
  | `identity` | string |  |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def update(client, service_sid, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v2/Services/#{service_sid}/Passkeys/Challenges",
      params: params,
      opts: opts,
      base_url: "https://verify.twilio.com",
      content_type: :json
    )
  end
end
