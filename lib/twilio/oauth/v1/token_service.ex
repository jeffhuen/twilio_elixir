# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Oauth.V1.TokenService do
  @moduledoc """
  Service for Token API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Issues a new Access token (optionally identity_token & refresh_token) in exchange of Oauth grant

  Operation: `CreateToken` | Tags: OauthV1Token

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ClientId` | string | A 34 character string that uniquely identifies this OAuth App. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `GrantType` | string | Grant type is a credential representing resource owner's authorization which can be used by client to obtain access token. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Audience` | string | The targeted audience uri |
  | `ClientSecret` | string | The credential for confidential OAuth App. |
  | `Code` | string | JWT token related to the authorization code grant type. |
  | `RedirectUri` | string | The redirect uri |
  | `RefreshToken` | string | JWT token related to refresh access token. |
  | `Scope` | string | The scope of token |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Oauth.V1.Token.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/token",
             params: params,
             opts: opts,
             base_url: "https://oauth.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Oauth.V1.Token)}
    end
  end
end
