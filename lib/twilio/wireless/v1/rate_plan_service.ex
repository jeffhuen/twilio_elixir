# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Wireless.V1.RatePlanService do
  @moduledoc """
  Capabilities and restrictions for SIMs

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListRatePlan` | Tags: WirelessV1RatePlan
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/RatePlans",
           params: params,
           opts: opts,
           base_url: "https://wireless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "rate_plans")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Wireless.V1.RatePlan)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "rate_plans"
    )
  end

  @doc """


  Operation: `CreateRatePlan` | Tags: WirelessV1RatePlan

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DataEnabled` | boolean | Whether SIMs can use GPRS/3G/4G/LTE data connectivity. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DataLimit` | integer | The total data usage (download and upload combined) in Megabytes that the Network allows during one month on the home network (T-Mobile USA). The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB and the default value is `1000`. |
  | `DataLimitStrategy` | string |  Values: `block`, `throttle` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DataMetering` | string | The model used to meter data usage. Can be: `payg` and `quota-1`, `quota-10`, and `quota-50`. Learn more about the available [data metering models](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#payg-vs-quota-data-plans). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It does not have to be unique. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InternationalRoaming` | array | The list of services that SIMs capable of using GPRS/3G/4G/LTE data connectivity can use outside of the United States. Can contain: `data` and `messaging`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `InternationalRoamingDataLimit` | integer | The total data usage (download and upload combined) in Megabytes that the Network allows during one month when roaming outside the United States. Can be up to 2TB. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessagingEnabled` | boolean | Whether SIMs can make, send, and receive SMS using [Commands](https://www.twilio.com/docs/iot/wireless/api/command-resource). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NationalRoamingDataLimit` | integer | The total data usage (download and upload combined) in Megabytes that the Network allows during one month on non-home networks in the United States. The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB. See [national roaming](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#national-roaming) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NationalRoamingEnabled` | boolean | Whether SIMs can roam on networks other than the home network (T-Mobile USA) in the United States. See [national roaming](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#national-roaming). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `VoiceEnabled` | boolean | Deprecated. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.RatePlan.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/RatePlans",
             params: params,
             opts: opts,
             base_url: "https://wireless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.RatePlan)}
    end
  end

  @doc """


  Operation: `FetchRatePlan` | Tags: WirelessV1RatePlan
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.RatePlan.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/RatePlans/#{sid}",
             opts: opts,
             base_url: "https://wireless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.RatePlan)}
    end
  end

  @doc """


  Operation: `UpdateRatePlan` | Tags: WirelessV1RatePlan

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It does not have to be unique. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Wireless.V1.RatePlan.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/RatePlans/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://wireless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Wireless.V1.RatePlan)}
    end
  end

  @doc """


  Operation: `DeleteRatePlan` | Tags: WirelessV1RatePlan
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/RatePlans/#{sid}",
      opts: opts,
      base_url: "https://wireless.twilio.com"
    )
  end
end
