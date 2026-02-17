# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Iam.V1.TokenService do
  @moduledoc """
  Service for Token API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Token.

  Operation: `CreateToken` | Tags: OauthV1Token

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `client_id` | string | A 34 character string that uniquely identifies this OAuth App. |
  | `grant_type` | string | Grant type is a credential representing resource owner's authorization which can be used by client to obtain access token. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `audience` | string | The targeted audience uri |
  | `client_secret` | string | The credential for confidential OAuth App. |
  | `code` | string | JWT token related to the authorization code grant type. |
  | `redirect_uri` | string | The redirect uri |
  | `refresh_token` | string | JWT token related to refresh access token. |
  | `scope` | string | The scope of token |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Iam.V1.Token.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/token",
             params: params,
             opts: opts,
             base_url: "https://iam.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Iam.V1.Token)}
    end
  end
end
