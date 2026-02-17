# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.Authtoken.PromoteService do
  @moduledoc """
  Auth Token promotion

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Promote the secondary Auth Token to primary. After promoting the new token, all requests to Twilio using your old primary Auth Token will result in an error.

  Operation: `UpdateAuthTokenPromotion` | Tags: AccountsV1AuthTokenPromotion
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.Authtoken.Promote.t()} | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/AuthTokens/Promote",
             params: params,
             opts: opts,
             base_url: "https://accounts.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.Authtoken.Promote)}
    end
  end
end
