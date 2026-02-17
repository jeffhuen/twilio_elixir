# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.WebchannelService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListWebChannel` | Tags: FlexV1WebChannel
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/WebChannels",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "flex_chat_channels")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Flex.V1.Webchannel)
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


  Operation: `CreateWebChannel` | Tags: FlexV1WebChannel

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChatFriendlyName` | string | The chat channel's friendly name. |
  | `CustomerFriendlyName` | string | The chat participant's friendly name. |
  | `FlexFlowSid` | string | The SID of the Flex Flow. |
  | `Identity` | string | The chat identity. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChatUniqueName` | string | The chat channel's unique name. |
  | `PreEngagementData` | string | The pre-engagement data. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Webchannel.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/WebChannels",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Webchannel)}
    end
  end

  @doc """


  Operation: `FetchWebChannel` | Tags: FlexV1WebChannel
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Webchannel.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/WebChannels/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Webchannel)}
    end
  end

  @doc """


  Operation: `UpdateWebChannel` | Tags: FlexV1WebChannel

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChatStatus` | string |  Values: `inactive` |
  | `PostEngagementData` | string | The post-engagement data. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Webchannel.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/WebChannels/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Webchannel)}
    end
  end

  @doc """


  Operation: `DeleteWebChannel` | Tags: FlexV1WebChannel
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/WebChannels/#{sid}",
      opts: opts,
      base_url: "https://flex-api.twilio.com"
    )
  end
end
