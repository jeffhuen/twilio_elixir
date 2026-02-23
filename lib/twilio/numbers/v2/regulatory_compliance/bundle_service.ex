# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.RegulatoryCompliance.BundleService do
  @moduledoc """
  Service for Bundle API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Bundles for an account.

  Operation: `ListBundle` | Tags: NumbersV2Bundle

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | The verification status of the Bundle resource. Please refer to [Bundle Statuses](https://www.twilio.com/docs/phone-numbers/regulatory/api/bundles#bundle-statuses) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BundleSids` | string | A comma-separated list of Bundle SIDs to filter the results (maximum 20). Each Bundle SID must match `^BU[0-9a-fA-F]{32}$`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | The string that you assigned to describe the resource. The column can contain 255 variable characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RegulationSid` | string | The unique string of a [Regulation resource](https://www.twilio.com/docs/phone-numbers/regulatory/api/regulations) that is associated to the Bundle resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IsoCountry` | string | The 2-digit [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the Bundle's phone number country ownership request. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NumberType` | string | The type of phone number of the Bundle's ownership request. Can be `local`, `mobile`, `national`, or `toll-free`. |
  | `EndUserType` | string | The end user type of the regulation of the Bundle. Can be `business` or `individual`. |
  | `HasValidUntilDate` | boolean | Indicates that the Bundle is a valid Bundle until a specified expiration date. |
  | `SortBy` | string | Can be `valid-until` or `date-updated`. Defaults to `date-created`. |
  | `SortDirection` | string | Default is `DESC`. Can be `ASC` or `DESC`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ValidUntilDate` | string (date-time) | Date to filter Bundles having their `valid_until_date` before or after the specified date. Can be `ValidUntilDate>=` or `ValidUntilDate<=`. Both can be used in conjunction as well. [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) is the acceptable date format. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ValidUntilDate<` | string (date-time) | Date to filter Bundles having their `valid_until_date` before or after the specified date. Can be `ValidUntilDate>=` or `ValidUntilDate<=`. Both can be used in conjunction as well. [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) is the acceptable date format. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ValidUntilDate>` | string (date-time) | Date to filter Bundles having their `valid_until_date` before or after the specified date. Can be `ValidUntilDate>=` or `ValidUntilDate<=`. Both can be used in conjunction as well. [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) is the acceptable date format. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/RegulatoryCompliance/Bundles",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Bundles for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Bundle.

  Operation: `CreateBundle` | Tags: NumbersV2Bundle

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | The email address that will receive updates when the Bundle resource changes status. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `EndUserType` | string |  Values: `individual`, `business` |
  | `IsTest` | boolean | Indicates that Bundle is a Test Bundle and will be Auto-Rejected |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IsoCountry` | string | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the Bundle's phone number country ownership request. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NumberType` | string | The type of phone number of the Bundle's ownership request. Can be `local`, `mobile`, `national`, or `toll-free`. |
  | `RegulationSid` | string | The unique string of a regulation that is associated to the Bundle resource. |
  | `StatusCallback` | string (uri) | The URL we call to inform your application of status changes. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/Bundles",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle)}
    end
  end

  @doc """
  Fetch a specific Bundle instance.

  Operation: `FetchBundle` | Tags: NumbersV2Bundle
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/RegulatoryCompliance/Bundles/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle)}
    end
  end

  @doc """
  Updates a Bundle in an account.

  Operation: `UpdateBundle` | Tags: NumbersV2Bundle

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | The email address that will receive updates when the Bundle resource changes status. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string |  Values: `draft`, `pending-review`, `in-review`, `twilio-rejected`, `twilio-approved`, `provisionally-approved` |
  | `StatusCallback` | string (uri) | The URL we call to inform your application of status changes. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/Bundles/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle)}
    end
  end

  @doc """
  Delete a specific Bundle.

  Operation: `DeleteBundle` | Tags: NumbersV2Bundle
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/RegulatoryCompliance/Bundles/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
