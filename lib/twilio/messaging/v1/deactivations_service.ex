# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.DeactivationsService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  A Deactivation resource to retrieve a list of United States phone numbers that have been deactivated by mobile carriers on a specific date.

  Operations: `fetch`
  """

  alias Twilio.Client

  @doc """
  Fetch a list of all United States numbers that have been deactivated on a specific date.

  Operation: `FetchDeactivation` | Tags: MessagingV1Deactivations

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Date` | string (date) | The request will return a list of all United States Phone Numbers that were deactivated on the day specified by this parameter. This date should be specified in YYYY-MM-DD format. |
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    Client.request(client, :get, "/v1/Deactivations",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
