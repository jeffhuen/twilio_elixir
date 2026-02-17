# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.SafeList.NumberService do
  @moduledoc """
  Service for Number API operations.

  Operations: `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Add a new phone number to SafeList.

  Operation: `CreateSafelist` | Tags: VerifyV2Safelist

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PhoneNumber` | string | The phone number to be added in SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164). |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.SafeList.Number.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/SafeList/Numbers",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.SafeList.Number)}
    end
  end

  @doc """
  Check if a phone number exists in SafeList.

  Operation: `FetchSafelist` | Tags: VerifyV2Safelist
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.SafeList.Number.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/SafeList/Numbers/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.SafeList.Number)}
    end
  end

  @doc """
  Remove a phone number from SafeList.

  Operation: `DeleteSafelist` | Tags: VerifyV2Safelist
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/SafeList/Numbers/#{sid}",
      opts: opts,
      base_url: "https://verify.twilio.com"
    )
  end
end
