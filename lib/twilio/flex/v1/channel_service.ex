# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.ChannelService do
  @moduledoc """
  Flex chat channels

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListChannel` | Tags: FlexV1Channel
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Channels",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "flex_chat_channels")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Flex.V1.Channel)
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
      "flex_chat_channels"
    )
  end

  @doc """


  Operation: `CreateChannel` | Tags: FlexV1Channel

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChatFriendlyName` | string | The chat channel's friendly name. |
  | `ChatUserFriendlyName` | string | The chat participant's friendly name. |
  | `FlexFlowSid` | string | The SID of the Flex Flow. |
  | `Identity` | string | The `identity` value that uniquely identifies the new resource's chat User. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChatUniqueName` | string | The chat channel's unique name. |
  | `LongLived` | boolean | Whether to create the channel as long-lived. |
  | `PreEngagementData` | string | The pre-engagement data. |
  | `Target` | string | The Target Contact Identity, for example the phone number of an SMS. |
  | `TaskAttributes` | string | The Task attributes to be added for the TaskRouter Task. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TaskSid` | string | The SID of the TaskRouter Task. Only valid when integration type is `task`. `null` for integration types `studio` & `external` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Channel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Channels",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Channel)}
    end
  end

  @doc """


  Operation: `FetchChannel` | Tags: FlexV1Channel
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Channel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Channels/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Channel)}
    end
  end

  @doc """


  Operation: `DeleteChannel` | Tags: FlexV1Channel
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Channels/#{sid}",
      opts: opts,
      base_url: "https://flex-api.twilio.com"
    )
  end
end
