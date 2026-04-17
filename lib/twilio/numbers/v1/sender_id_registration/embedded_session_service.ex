# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.SenderIdRegistration.EmbeddedSessionService do
  @moduledoc """
  Create a new Embedded Session for an existing Sender ID Registration

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Creates a new embedded Persona inquiry session for an existing registration in DRAFT or TWILIO_REJECTED status. Use this to resume an incomplete registration or resubmit a rejected one.

  Operation: `CreateSenderIdRegistrationEmbeddedSession` | Tags: NumbersV1SenderIdRegistrationEmbeddedSession
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.SenderIdRegistration.EmbeddedSession.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, bundle_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/SenderIdRegistrations/#{bundle_sid}/EmbeddedSessions",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V1.SenderIdRegistration.EmbeddedSession
       )}
    end
  end
end
