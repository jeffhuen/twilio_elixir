# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Routes.V2.PhonenumberService do
  @moduledoc """


  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch the Inbound Processing Region assigned to a phone number.

  Operation: `FetchPhoneNumber` | Tags: RoutesV2PhoneNumber
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Routes.V2.Phonenumber.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/PhoneNumbers/#{sid}",
             opts: opts,
             base_url: "https://routes.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Routes.V2.Phonenumber)}
    end
  end

  @doc """
  Assign an Inbound Processing Region to a phone number.

  Operation: `UpdatePhoneNumber` | Tags: RoutesV2PhoneNumber

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A human readable description of this resource, up to 64 characters. |
  | `VoiceRegion` | string | The Inbound Processing Region used for this phone number for voice |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Routes.V2.Phonenumber.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/PhoneNumbers/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://routes.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Routes.V2.Phonenumber)}
    end
  end
end
