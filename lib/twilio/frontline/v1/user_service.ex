# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Frontline.V1.UserService do
  @moduledoc """
  A User resource represents a frontline user.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a frontline user

  Operation: `FetchUser` | Tags: FrontlineV1User
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Frontline.V1.User.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Users/#{sid}",
             opts: opts,
             base_url: "https://frontline-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Frontline.V1.User)}
    end
  end

  @doc """
  Update an existing frontline user

  Operation: `UpdateUser` | Tags: FrontlineV1User

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Avatar` | string | The avatar URL which will be shown in Frontline application. |
  | `FriendlyName` | string | The string that you assigned to describe the User. |
  | `IsAvailable` | boolean | Whether the User is available for new conversations. Set to `false` to prevent User from receiving new inbound conversations if you are using [Pool Routing](https://www.twilio.com/docs/frontline/handle-incoming-conversations#3-pool-routing). |
  | `State` | string |  Values: `active`, `deactivated` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Frontline.V1.User.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Users/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://frontline-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Frontline.V1.User)}
    end
  end
end
