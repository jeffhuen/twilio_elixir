# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.Hostednumber.EligibilityService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create an eligibility check for a number that you want to host in Twilio.

  Operation: `CreateEligibility` | Tags: NumbersV1Eligibility
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.Hostednumber.Eligibility.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/HostedNumber/Eligibility",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.Hostednumber.Eligibility)}
    end
  end
end
