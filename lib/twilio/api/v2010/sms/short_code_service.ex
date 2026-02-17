# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.SMS.ShortCodeService do
  @moduledoc """
  Messaging short codes

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of short-codes belonging to the account used to make the request

  Operation: `ListShortCode` | Tags: Api20100401ShortCode

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that identifies the ShortCode resources to read. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ShortCode` | string | Only show the ShortCode resources that match this pattern. You can specify partial numbers and use '*' as a wildcard for any digit. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/SMS/ShortCodes.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "short_codes")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.SMS.ShortCode)
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of short-codes belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "short_codes"
    )
  end

  @doc """
  Fetch an instance of a short code

  Operation: `FetchShortCode` | Tags: Api20100401ShortCode
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.SMS.ShortCode.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/SMS/ShortCodes/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.SMS.ShortCode)}
    end
  end

  @doc """
  Update a short code with the following parameters

  Operation: `UpdateShortCode` | Tags: Api20100401ShortCode

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ApiVersion` | string | The API version to use to start a new TwiML session. Can be: `2010-04-01` or `2008-08-01`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you created to describe this resource. It can be up to 64 characters long. By default, the `FriendlyName` is the short code. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackMethod` | string (http-method) | The HTTP method that we should use to call the `sms_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackUrl` | string (uri) | The URL that we should call if an error occurs while retrieving or executing the TwiML from `sms_url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsMethod` | string (http-method) | The HTTP method we should use when calling the `sms_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `SmsUrl` | string (uri) | The URL we should call when receiving an incoming SMS message to this short code. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.SMS.ShortCode.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SMS/ShortCodes/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.SMS.ShortCode)}
    end
  end
end
