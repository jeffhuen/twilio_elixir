# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.Porting.Portin.PhonenumberService do
  @moduledoc """


  Operations: `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a phone number by port in request SID and phone number SID

  Operation: `FetchPortingPortInPhoneNumber` | Tags: NumbersV1PortingPortInPhoneNumber
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.Porting.Portin.Phonenumber.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, port_in_request_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Porting/PortIn/#{port_in_request_sid}/PhoneNumber/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.Porting.Portin.Phonenumber)}
    end
  end

  @doc """
  Allows to cancel a port in request phone number by SID

  Operation: `DeletePortingPortInPhoneNumber` | Tags: NumbersV1PortingPortInPhoneNumber
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, port_in_request_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Porting/PortIn/#{port_in_request_sid}/PhoneNumber/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
