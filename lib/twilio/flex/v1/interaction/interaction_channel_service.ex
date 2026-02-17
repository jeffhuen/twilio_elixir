# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Interaction.InteractionChannelService do
  @moduledoc """
  Service for InteractionChannel API operations.

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List all Channels for an Interaction.

  Operation: `ListInteractionChannel` | Tags: FlexV1InteractionChannel
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, interaction_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Interactions/#{interaction_sid}/Channels",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "channels")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Interaction.InteractionChannel
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List all Channels for an Interaction. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, interaction_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, interaction_sid, Map.merge(params, page_opts), opts)
      end,
      "channels"
    )
  end

  @doc """
  Fetch a Channel for an Interaction.

  Operation: `FetchInteractionChannel` | Tags: FlexV1InteractionChannel
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.InteractionChannel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, interaction_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Interactions/#{interaction_sid}/Channels/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Interaction.InteractionChannel)}
    end
  end

  @doc """
  Update an existing Interaction Channel.

  Operation: `UpdateInteractionChannel` | Tags: FlexV1InteractionChannel

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `closed`, `inactive` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Routing` | string | It changes the state of associated tasks. Routing status is required, When the channel status is set to `inactive`. Allowed Value for routing status is `closed`. Otherwise Optional, if not specified, all tasks will be set to `wrapping`. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.InteractionChannel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, interaction_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Interactions/#{interaction_sid}/Channels/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Interaction.InteractionChannel)}
    end
  end
end
