# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.A2p.Brandregistration.SmsotpService do
  @moduledoc """
  A Messaging Service resource to retry OTP verification for Sole Proprietor Brand Registrations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `CreateBrandRegistrationOtp` | Tags: MessagingV1BrandRegistrationOtp
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.A2p.Brandregistration.Smsotp.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, brand_registration_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/a2p/BrandRegistrations/#{brand_registration_sid}/SmsOtp",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.A2p.Brandregistration.Smsotp)}
    end
  end
end
