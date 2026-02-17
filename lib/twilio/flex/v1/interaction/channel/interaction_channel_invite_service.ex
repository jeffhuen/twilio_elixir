# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Interaction.Channel.InteractionChannelInviteService do
  @moduledoc """
  Service for InteractionChannelInvite API operations.

  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List all Invites for a Channel.

  Operation: `ListInteractionChannelInvite` | Tags: FlexV1InteractionChannelInvite
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Invites",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "invites")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelInvite
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List all Invites for a Channel. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, interaction_sid, channel_sid, Map.merge(params, page_opts), opts)
      end,
      "invites"
    )
  end

  @doc """
  Invite an Agent or a TaskQueue to a Channel.

  Operation: `CreateInteractionChannelInvite` | Tags: FlexV1InteractionChannelInvite

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Routing` | string | The Interaction's routing logic. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelInvite.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, interaction_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Interactions/#{interaction_sid}/Channels/#{channel_sid}/Invites",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelInvite
       )}
    end
  end
end
