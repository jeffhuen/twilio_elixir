# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Entity.ChallengeService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Challenges for a Factor.

  Operation: `ListChallenge` | Tags: VerifyV2Challenge

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FactorSid` | string | The unique SID identifier of the Factor. |
  | `Status` | string | The Status of the Challenges to fetch. One of `pending`, `expired`, `approved` or `denied`. |
  | `Order` | string | The desired sort order of the Challenges list. One of `asc` or `desc` for ascending and descending respectively. Defaults to `asc`. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, identity, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/Services/#{service_sid}/Entities/#{identity}/Challenges",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "challenges")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Verify.V2.Service.Entity.Challenge
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Challenges for a Factor. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, identity, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, identity, Map.merge(params, page_opts), opts)
      end,
      "challenges"
    )
  end

  @doc """
  Create a new Challenge for the Factor

  Operation: `CreateChallenge` | Tags: VerifyV2Challenge

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FactorSid` | string | The unique SID identifier of the Factor. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AuthPayload` | string | Optional payload used to verify the Challenge upon creation. Only used with a Factor of type `totp` to carry the TOTP code that needs to be verified. For `TOTP` this value must be between 3 and 8 characters long. |
  | `Details.Fields` | array | A list of objects that describe the Fields included in the Challenge. Each object contains the label and value of the field, the label can be up to 36 characters in length and the value can be up to 128 characters in length. Used when `factor_type` is `push`. There can be up to 20 details fields. |
  | `Details.Message` | string | Shown to the user when the push notification arrives. Required when `factor_type` is `push`. Can be up to 256 characters in length |
  | `ExpirationDate` | string (date-time) | The date-time when this Challenge expires, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. The default value is five (5) minutes after Challenge creation. The max value is sixty (60) minutes after creation. |
  | `HiddenDetails` | string | Details provided to give context about the Challenge. Not shown to the end user. It must be a stringified JSON with only strings values eg. `{"ip": "172.168.1.234"}`. Can be up to 1024 characters in length |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Challenge.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, identity, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Challenges",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Entity.Challenge)}
    end
  end

  @doc """
  Fetch a specific Challenge.

  Operation: `FetchChallenge` | Tags: VerifyV2Challenge
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Challenge.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, identity, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Challenges/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Entity.Challenge)}
    end
  end

  @doc """
  Verify a specific Challenge.

  Operation: `UpdateChallenge` | Tags: VerifyV2Challenge

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AuthPayload` | string | The optional payload needed to verify the Challenge. E.g., a TOTP would use the numeric code. For `TOTP` this value must be between 3 and 8 characters long. For `Push` this value can be up to 5456 characters in length |
  | `Metadata` | string | Custom metadata associated with the challenge. This is added by the Device/SDK directly to allow for the inclusion of device information. It must be a stringified JSON with only strings values eg. `{"os": "Android"}`. Can be up to 1024 characters in length. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Challenge.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, identity, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Challenges/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Entity.Challenge)}
    end
  end
end
