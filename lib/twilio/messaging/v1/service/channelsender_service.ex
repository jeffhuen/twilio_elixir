# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Service.ChannelsenderService do
  @moduledoc """
  A Messaging Service resource to read, fetch all Channel Senders associated with a Messaging Service.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListChannelSender` | Tags: MessagingV1ChannelSender
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{messaging_service_sid}/ChannelSenders",
           params: params,
           opts: opts,
           base_url: "https://messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "senders")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Messaging.V1.Service.Channelsender
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, messaging_service_sid, Map.merge(params, page_opts), opts)
      end,
      "senders"
    )
  end

  @doc """


  Operation: `CreateChannelSender` | Tags: MessagingV1ChannelSender

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Sid` | string | The SID of the Channel Sender being added to the Service. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.Channelsender.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{messaging_service_sid}/ChannelSenders",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service.Channelsender)}
    end
  end

  @doc """


  Operation: `FetchChannelSender` | Tags: MessagingV1ChannelSender
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.Channelsender.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, messaging_service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{messaging_service_sid}/ChannelSenders/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service.Channelsender)}
    end
  end

  @doc """


  Operation: `DeleteChannelSender` | Tags: MessagingV1ChannelSender
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, messaging_service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{messaging_service_sid}/ChannelSenders/#{sid}",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
