# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Interaction.Channel.InteractionChannelParticipantService do
  @moduledoc """


  Operations: `list`, `create`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List all Participants for a Channel.

  Operation: `ListInteractionChannelParticipant` | Tags: FlexV1InteractionChannelParticipant
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Participants",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "participants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List all Participants for a Channel. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, interaction_sid, channel_sid, Map.merge(params, page_opts), opts)
      end,
      "participants"
    )
  end

  @doc """
  Add a Participant to a Channel.

  Operation: `CreateInteractionChannelParticipant` | Tags: FlexV1InteractionChannelParticipant

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `MediaProperties` | string | JSON representing the Media Properties for the new Participant. |
  | `Type` | string |  Values: `supervisor`, `customer`, `external`, `agent`, `unknown` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `RoutingProperties` | string | Object representing the Routing Properties for the new Participant. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant.t()}
          | {:error, Twilio.Error.t()}
  def create(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Participants",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant
       )}
    end
  end

  @doc """
  Update an existing Channel Participant.

  Operation: `UpdateInteractionChannelParticipant` | Tags: FlexV1InteractionChannelParticipant

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `closed`, `wrapup` |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant.t()}
          | {:error, Twilio.Error.t()}
  def update(client, interaction_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Participants/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant
       )}
    end
  end
end
