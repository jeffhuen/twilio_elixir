# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.Dialingpermission.CountryService do
  @moduledoc """
  Service for Country API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve all voice dialing country permissions for this account

  Operation: `ListDialingPermissionsCountry` | Tags: VoiceV1Country

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IsoCode` | string (iso-country-code) | Filter to retrieve the country permissions by specifying the [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) |
  | `Continent` | string | Filter to retrieve the country permissions by specifying the continent |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CountryCode` | string | Filter the results by specified [country codes](https://www.itu.int/itudoc/itu-t/ob-lists/icc/e164_763.html) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `LowRiskNumbersEnabled` | boolean | Filter to retrieve the country permissions with dialing to low-risk numbers enabled. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HighRiskSpecialNumbersEnabled` | boolean | Filter to retrieve the country permissions with dialing to high-risk special service numbers enabled. Can be: `true` or `false` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HighRiskTollfraudNumbersEnabled` | boolean | Filter to retrieve the country permissions with dialing to high-risk [toll fraud](https://www.twilio.com/blog/how-to-protect-your-account-from-toll-fraud-with-voice-dialing-geo-permissions-html) numbers enabled. Can be: `true` or `false`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/DialingPermissions/Countries",
           params: params,
           opts: opts,
           base_url: "https://voice.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "content")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Voice.V1.Dialingpermission.Country
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve all voice dialing country permissions for this account (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "content"
    )
  end

  @doc """
  Retrieve voice dialing country permissions identified by the given ISO country code

  Operation: `FetchDialingPermissionsCountry` | Tags: VoiceV1Country
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Dialingpermission.Country.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/DialingPermissions/Countries/#{sid}",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Dialingpermission.Country)}
    end
  end
end
