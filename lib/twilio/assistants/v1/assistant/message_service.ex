# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Assistants.V1.Assistant.MessageService do
  @moduledoc """
  Service for Message API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  send a message

  Operation: `CreateMessage`
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Assistants.V1.Assistant.Message.t()} | {:error, Twilio.Error.t()}
  def create(client, id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Assistants/#{id}/Messages",
             params: params,
             opts: opts,
             base_url: "https://assistants.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Assistants.V1.Assistant.Message)}
    end
  end
end
