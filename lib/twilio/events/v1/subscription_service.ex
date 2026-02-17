# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.SubscriptionService do
  @moduledoc """
  Subscription to send Event Types to a Sink

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a paginated list of Subscriptions belonging to the account used to make the request.

  Operation: `ListSubscription` | Tags: EventsV1Subscription

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SinkSid` | string | The SID of the sink that the list of Subscriptions should be filtered by. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Subscriptions",
           params: params,
           opts: opts,
           base_url: "https://events.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "subscriptions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Events.V1.Subscription)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a paginated list of Subscriptions belonging to the account used to make the request. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "subscriptions"
    )
  end

  @doc """
  Create a new Subscription.

  Operation: `CreateSubscription` | Tags: EventsV1Subscription

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | A human readable description for the Subscription **This value should not contain PII.** |
  | `SinkSid` | string | The SID of the sink that events selected by this subscription should be sent to. Sink must be active for the subscription to be created. |
  | `Types` | array | An array of objects containing the subscribed Event Types |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Subscription.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Subscriptions",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Subscription)}
    end
  end

  @doc """
  Fetch a specific Subscription.

  Operation: `FetchSubscription` | Tags: EventsV1Subscription
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Subscription.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Subscriptions/#{sid}",
             opts: opts,
             base_url: "https://events.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Subscription)}
    end
  end

  @doc """
  Update a Subscription.

  Operation: `UpdateSubscription` | Tags: EventsV1Subscription

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | A human readable description for the Subscription. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Subscription.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Subscriptions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Subscription)}
    end
  end

  @doc """
  Delete a specific Subscription.

  Operation: `DeleteSubscription` | Tags: EventsV1Subscription
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Subscriptions/#{sid}",
      opts: opts,
      base_url: "https://events.twilio.com"
    )
  end
end
