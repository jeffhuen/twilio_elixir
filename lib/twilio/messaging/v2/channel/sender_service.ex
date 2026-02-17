# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V2.Channel.SenderService do
  @moduledoc """
  The Senders resource represents a messaging channel sender (WhatsApp, RCS).

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Senders for an account.

  Operation: `ListChannelsSender` | Tags: MessagingV2ChannelsSender

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Channel` | string |  |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Channels/Senders",
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
                 Twilio.Resources.Messaging.V2.Channel.Sender
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Senders for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "senders"
    )
  end

  @doc """
  Create a Sender.

  Operation: `CreateChannelsSender` | Tags: MessagingV2ChannelsSender
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V2.Channel.Sender.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Channels/Senders",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V2.Channel.Sender)}
    end
  end

  @doc """
  Retrieve a Sender.

  Operation: `FetchChannelsSender` | Tags: MessagingV2ChannelsSender
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V2.Channel.Sender.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Channels/Senders/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V2.Channel.Sender)}
    end
  end

  @doc """
  (WhatsApp only) Update a Sender. You can update a sender's information, including `profile`, `webhook`, and `configuration`. To verify a phone number, set `configuration.verification_code` to the One-time Password (OTP) that you received.

  Operation: `UpdateChannelsSender` | Tags: MessagingV2ChannelsSender
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V2.Channel.Sender.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Channels/Senders/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V2.Channel.Sender)}
    end
  end

  @doc """
  (WhatsApp only) Delete a Sender.

  Operation: `DeleteChannelsSender` | Tags: MessagingV2ChannelsSender
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Channels/Senders/#{sid}",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
