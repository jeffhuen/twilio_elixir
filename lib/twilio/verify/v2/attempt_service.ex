# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.AttemptService do
  @moduledoc """
  Service for Attempt API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List all the verification attempts for a given Account.

  Operation: `ListVerificationAttempt` | Tags: VerifyV2VerificationAttempt

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedAfter` | string (date-time) | Datetime filter used to consider only Verification Attempts created after this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedBefore` | string (date-time) | Datetime filter used to consider only Verification Attempts created before this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z. |
  | `ChannelData.To` | string | Destination of a verification. It is phone number in E.164 format. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Country` | string (iso-country-code) | Filter used to query Verification Attempts sent to the specified destination country. |
  | `Channel` | string | Filter used to query Verification Attempts by communication channel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerifyServiceSid` | string | Filter used to query Verification Attempts by verify service. Only attempts of the provided SID will be returned. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VerificationSid` | string | Filter used to return all the Verification Attempts of a single verification. Only attempts of the provided verification SID will be returned. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | Filter used to query Verification Attempts by conversion status. Valid values are `UNCONVERTED`, for attempts that were not converted, and `CONVERTED`, for attempts that were confirmed. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Attempts",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "attempts")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Verify.V2.Attempt)
         }}

      error ->
        error
    end
  end

  @doc "Stream: List all the verification attempts for a given Account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "attempts"
    )
  end

  @doc """
  Fetch a specific verification attempt.

  Operation: `FetchVerificationAttempt` | Tags: VerifyV2VerificationAttempt
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Attempt.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Attempts/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Attempt)}
    end
  end
end
