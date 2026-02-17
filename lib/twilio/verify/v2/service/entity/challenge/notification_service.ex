# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Entity.Challenge.NotificationService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Notification for the corresponding Challenge

  Operation: `CreateNotification` | Tags: VerifyV2Notification

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Ttl` | integer | How long, in seconds, the notification is valid. Can be an integer between 0 and 300. Default is 300. Delivery is attempted until the TTL elapses, even if the device is offline. 0 means that the notification delivery is attempted immediately, only once, and is not stored for future delivery. |
  """
  @spec create(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Challenge.Notification.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, identity, challenge_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Challenges/#{challenge_sid}/Notifications",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Verify.V2.Service.Entity.Challenge.Notification
       )}
    end
  end
end
