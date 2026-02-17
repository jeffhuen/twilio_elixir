# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.InteractionService do
  @moduledoc """


  Operations: `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Interaction.

  Operation: `CreateInteraction` | Tags: FlexV1Interaction

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Channel` | string | The Interaction's channel. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `InteractionContextSid` | string | The Interaction context sid is used for adding a context lookup sid |
  | `Routing` | string | The Interaction's routing logic. |
  | `WebhookTtid` | string | The unique identifier for Interaction level webhook |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Interactions",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Interaction)}
    end
  end

  @doc """


  Operation: `FetchInteraction` | Tags: FlexV1Interaction
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Interactions/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Interaction)}
    end
  end

  @doc """
  Updates an interaction.

  Operation: `UpdateInteraction` | Tags: FlexV1Interaction

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `WebhookTtid` | string | The unique identifier for Interaction level webhook |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Interaction.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Interactions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Interaction)}
    end
  end
end
