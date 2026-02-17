# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Oauth.V2.TokenService do
  @moduledoc """
  Service for Token API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Token.

  Operation: `CreateOauth2Token` | Tags: OauthV2Token

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `audience` | string | The targeted audience uri |
  | `client_id` | string | A 34 character string that uniquely identifies this OAuth App. |
  | `client_secret` | string | The credential for confidential OAuth App. |
  | `code` | string | JWT token related to the authorization code grant type. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `grant_type` | string | Grant type is a credential representing resource owner's authorization which can be used by client to obtain access token. |
  | `redirect_uri` | string | The redirect uri |
  | `refresh_token` | string | JWT token related to refresh access token. |
  | `scope` | string | The scope of token |

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `account_sid` | string | Optional Account SID to perform on behalf of requests. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Oauth.V2.Token.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/token",
             params: params,
             opts: opts,
             base_url: "https://oauth.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Oauth.V2.Token)}
    end
  end
end
