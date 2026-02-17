# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Hostednumber.Order.BulkService do
  @moduledoc """
  Service for Bulk API operations.

  Operations: `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Host multiple phone numbers on Twilio's platform.

  Operation: `CreateBulkHostedNumberOrder` | Tags: NumbersV2BulkHostedNumberOrder
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Hostednumber.Order.Bulk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/HostedNumber/Orders/Bulk",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.Hostednumber.Order.Bulk)}
    end
  end

  @doc """
  Fetch a specific BulkHostedNumberOrder.

  Operation: `FetchBulkHostedNumberOrder` | Tags: NumbersV2BulkHostedNumberOrder

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `OrderStatus` | string | Order status can be used for filtering on Hosted Number Order status values. To see a complete list of order statuses, please check 'https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/hosted-number-order-resource#status-values'. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Hostednumber.Order.Bulk.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/HostedNumber/Orders/Bulk/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.Hostednumber.Order.Bulk)}
    end
  end
end
