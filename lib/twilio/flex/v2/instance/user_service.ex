# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V2.Instance.UserService do
  @moduledoc """
  Service for User API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch flex user for the given flex user sid

  Operation: `FetchFlexUser` | Tags: FlexV2FlexUser
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V2.Instance.User.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, instance_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Instances/#{instance_sid}/Users/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V2.Instance.User)}
    end
  end

  @doc """
  Update flex user for the given flex user sid

  Operation: `UpdateFlexUser` | Tags: FlexV2FlexUser

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | Email of the User. |
  | `Locale` | string | The locale preference of the user. |
  | `UserSid` | string | The unique SID identifier of the Twilio Unified User. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V2.Instance.User.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, instance_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Instances/#{instance_sid}/Users/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V2.Instance.User)}
    end
  end
end
