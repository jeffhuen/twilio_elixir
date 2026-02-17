# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.AuthToken.PromoteService do
  @moduledoc """
  Auth Token promotion

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Promote the secondary Auth Token to primary. After promoting the new token, all requests to Twilio using your old primary Auth Token will result in an error.

  Operation: `UpdateAuthTokenPromotion` | Tags: AccountsV1AuthTokenPromotion
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.AuthToken.Promote.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/AuthTokens/Promote",
             params: params,
             opts: opts,
             base_url: "https://accounts.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.AuthToken.Promote)}
    end
  end
end
