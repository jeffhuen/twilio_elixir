# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V3.Indicator.TypingService do
  @moduledoc """
  Send a typing indicator event for OTT channels (e.g., WhatsApp, Apple Messages for Business).

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Send a typing indicator to notify the recipient that you are composing a message. Supported channels: WhatsApp, Apple Messages for Business. The request body varies by channel — use the `channel` field as the discriminator.


  Operation: `CreateV3TypingIndicator` | Tags: MessagingV3TypingIndicator
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v3/Indicators/Typing.json",
      params: params,
      opts: opts,
      base_url: "https://messaging.twilio.com",
      content_type: :json
    )
  end
end
