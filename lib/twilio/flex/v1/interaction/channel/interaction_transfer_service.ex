# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Interaction.Channel.InteractionTransferService do
  @moduledoc """


  Operations: `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Transfer.

  Operation: `CreateInteractionTransfer` | Tags: FlexV1InteractionTransfer
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer.t()}
          | {:error, Twilio.Error.t()}
  def create(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Transfers",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer
       )}
    end
  end

  @doc """
  Fetch a specific Transfer by SID.

  Operation: `FetchInteractionTransfer` | Tags: FlexV1InteractionTransfer
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, interaction_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Transfers/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer
       )}
    end
  end

  @doc """
  Update an existing Transfer.

  Operation: `UpdateInteractionTransfer` | Tags: FlexV1InteractionTransfer
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer.t()}
          | {:error, Twilio.Error.t()}
  def update(client, interaction_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Transfers/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer
       )}
    end
  end
end
