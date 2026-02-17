# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Message.FeedbackService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  The MessageFeedback subresource of a Message resource. MessageFeedback contains the reported outcome of whether the Message recipient performed a tracked user action.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create Message Feedback to confirm a tracked user action was performed by the recipient of the associated Message

  Operation: `CreateMessageFeedback` | Tags: Api20100401Feedback

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Outcome` | string |  Values: `confirmed`, `unconfirmed` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Message.Feedback.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, message_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Messages/#{message_sid}/Feedback.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Message.Feedback)}
    end
  end
end
