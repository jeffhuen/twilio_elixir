# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.TokenService do
  @moduledoc """
  Credentials for ICE servers

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new token for ICE servers

  Operation: `CreateToken` | Tags: Api20100401Token

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Ttl` | integer | The duration in seconds for which the generated credentials are valid. The default value is 86400 (24 hours). |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Token.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/2010-04-01/Accounts/#{client.account_sid}/Tokens.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Token)}
    end
  end
end
