# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Recording.AddOnResult.Payload.DataService do
  @moduledoc """
  The Payload Data subresource hosts the actual data returned by the Add-on

  Operations: `fetch`
  """

  alias Twilio.Client

  @doc """
  Fetch an instance of a result payload

  Operation: `FetchRecordingAddOnResultPayloadData` | Tags: Api20100401Data
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def fetch(client, reference_sid, add_on_result_sid, payload_sid, opts \\ []) do
    Client.request(
      client,
      :get,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults/#{add_on_result_sid}/Payloads/#{payload_sid}/Data.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
