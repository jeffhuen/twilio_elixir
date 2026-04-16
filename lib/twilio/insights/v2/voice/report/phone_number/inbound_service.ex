# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V2.Voice.Report.PhoneNumber.InboundService do
  @moduledoc """
  Inbound Report resource for Voice Insights Phone Numbers Level

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create Inbound specific Phone Numbers Report for a specific account with given time range.

  Operation: `CreateInboundPhoneNumbersReport` | Tags: InsightsV1CreateInboundPhoneNumbersReport
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V2.Voice.Report.PhoneNumber.Inbound.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Voice/Reports/PhoneNumbers/Inbound",
             params: params,
             opts: opts,
             base_url: "https://insights.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Insights.V2.Voice.Report.PhoneNumber.Inbound
       )}
    end
  end
end
