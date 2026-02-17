# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Usage.TriggerService do
  @moduledoc """
  Webhooks that notify you of usage thresholds

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of usage-triggers belonging to the account used to make the request

  Operation: `ListUsageTrigger` | Tags: Api20100401Trigger

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Recurring` | string | The frequency of recurring UsageTriggers to read. Can be: `daily`, `monthly`, or `yearly` to read recurring UsageTriggers. An empty value or a value of `alltime` reads non-recurring UsageTriggers. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TriggerBy` | string | The trigger field of the UsageTriggers to read.  Can be: `count`, `usage`, or `price` as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UsageCategory` | string | The usage category of the UsageTriggers to read. Must be a supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories). |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Usage/Triggers.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "usage_triggers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Usage.Trigger)
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of usage-triggers belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "usage_triggers"
    )
  end

  @doc """
  Create a new UsageTrigger

  Operation: `CreateUsageTrigger` | Tags: Api20100401Trigger

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CallbackUrl` | string (uri) | The URL we should call using `callback_method` when the trigger fires. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TriggerValue` | string | The usage value at which the trigger should fire.  For convenience, you can use an offset value such as `+30` to specify a trigger_value that is 30 units more than the current usage value. Be sure to urlencode a `+` as `%2B`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UsageCategory` | string | The usage category that the trigger should watch.  Use one of the supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) for this value. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackMethod` | string (http-method) | The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `Recurring` | string |  Values: `daily`, `monthly`, `yearly`, `alltime` |
  | `TriggerBy` | string |  Values: `count`, `usage`, `price` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Usage.Trigger.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Usage/Triggers.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Usage.Trigger)}
    end
  end

  @doc """
  Fetch and instance of a usage-trigger

  Operation: `FetchUsageTrigger` | Tags: Api20100401Trigger
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Usage.Trigger.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Usage/Triggers/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Usage.Trigger)}
    end
  end

  @doc """
  Update an instance of a usage trigger

  Operation: `UpdateUsageTrigger` | Tags: Api20100401Trigger

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackMethod` | string (http-method) | The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  | `CallbackUrl` | string (uri) | The URL we should call using `callback_method` when the trigger fires. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Usage.Trigger.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Usage/Triggers/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Usage.Trigger)}
    end
  end

  @doc """


  Operation: `DeleteUsageTrigger` | Tags: Api20100401Trigger
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Usage/Triggers/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
