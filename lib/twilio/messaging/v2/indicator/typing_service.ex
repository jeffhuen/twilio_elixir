# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V2.Indicator.TypingService do
  @moduledoc """
  Send a typing indicator event between OTT senders (e.g., WhatsApp, RCS).

  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  Send a typing indicator to notify the recipient that you are composing a message. Currently supported for whatsapp channel only. For WhatsApp, `messageId` is required.


  Operation: `CreateTypingIndicator` | Tags: MessagingV2TypingIndicator
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v2/Indicators/Typing.json",
      params: params,
      opts: opts,
      base_url: "https://messaging.twilio.com",
      content_type: :form
    )
  end
end
