# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.Dialingpermission.Country.HighriskspecialprefixeService do
  @moduledoc """
  Service for Highriskspecialprefixe API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Fetch the high-risk special services prefixes from the country resource corresponding to the [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)

  Operation: `ListDialingPermissionsHrsPrefixes` | Tags: VoiceV1HighriskSpecialPrefix
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, iso_code, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/DialingPermissions/Countries/#{iso_code}/HighRiskSpecialPrefixes",
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
                 Twilio.Resources.Voice.V1.Dialingpermission.Country.Highriskspecialprefixe
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Fetch the high-risk special services prefixes from the country resource corresponding to the [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, iso_code, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, iso_code, Map.merge(params, page_opts), opts)
      end,
      "content"
    )
  end
end
