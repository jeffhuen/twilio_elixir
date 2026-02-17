# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.Subscription.SubscribedeventService do
  @moduledoc """
  Event subscribed to in the parent Subscription

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Subscribed Event types for a Subscription.

  Operation: `ListSubscribedEvent` | Tags: EventsV1SubscribedEvent
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, subscription_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Subscriptions/#{subscription_sid}/SubscribedEvents",
           params: params,
           opts: opts,
           base_url: "https://events.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "types")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Events.V1.Subscription.Subscribedevent
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Subscribed Event types for a Subscription. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, subscription_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, subscription_sid, Map.merge(params, page_opts), opts)
      end,
      "types"
    )
  end

  @doc """
  Add an event type to a Subscription.

  Operation: `CreateSubscribedEvent` | Tags: EventsV1SubscribedEvent

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | string | Type of event being subscribed to. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SchemaVersion` | integer | The schema version that the Subscription should use. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Subscription.Subscribedevent.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, subscription_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Subscriptions/#{subscription_sid}/SubscribedEvents",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Events.V1.Subscription.Subscribedevent)}
    end
  end

  @doc """
  Read an Event for a Subscription.

  Operation: `FetchSubscribedEvent` | Tags: EventsV1SubscribedEvent
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Subscription.Subscribedevent.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, subscription_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Subscriptions/#{subscription_sid}/SubscribedEvents/#{sid}",
             opts: opts,
             base_url: "https://events.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Events.V1.Subscription.Subscribedevent)}
    end
  end

  @doc """
  Update an Event for a Subscription.

  Operation: `UpdateSubscribedEvent` | Tags: EventsV1SubscribedEvent

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SchemaVersion` | integer | The schema version that the Subscription should use. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Subscription.Subscribedevent.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, subscription_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Subscriptions/#{subscription_sid}/SubscribedEvents/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Events.V1.Subscription.Subscribedevent)}
    end
  end

  @doc """
  Remove an event type from a Subscription.

  Operation: `DeleteSubscribedEvent` | Tags: EventsV1SubscribedEvent
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, subscription_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Subscriptions/#{subscription_sid}/SubscribedEvents/#{sid}",
      opts: opts,
      base_url: "https://events.twilio.com"
    )
  end
end
