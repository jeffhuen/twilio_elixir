# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Passkey.FactorService do
  @moduledoc """
  Service for Factor API operations.

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  Create a new Passkeys Factor for the Entity

  Operation: `CreateNewFactorPasskey` | Tags: VerifyV2NewFactor

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `friendly_name` | string |  |
  | `identity` | string |  |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `config` | object |  |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v2/Services/#{service_sid}/Passkeys/Factors",
      params: params,
      opts: opts,
      base_url: "https://verify.twilio.com",
      content_type: :json
    )
  end
end
