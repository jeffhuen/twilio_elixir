# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.HostedNumber.Eligibility.BulkService do
  @moduledoc """
  Service for Bulk API operations.

  Operations: `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a bulk eligibility check for a set of numbers that you want to host in Twilio.

  Operation: `CreateBulkEligibility` | Tags: NumbersV1BulkEligibility
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.HostedNumber.Eligibility.Bulk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/HostedNumber/Eligibility/Bulk",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.HostedNumber.Eligibility.Bulk)}
    end
  end

  @doc """
  Fetch an eligibility bulk check that you requested to host in Twilio.

  Operation: `FetchBulkEligibility` | Tags: NumbersV1BulkEligibility
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.HostedNumber.Eligibility.Bulk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/HostedNumber/Eligibility/Bulk/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.HostedNumber.Eligibility.Bulk)}
    end
  end
end
