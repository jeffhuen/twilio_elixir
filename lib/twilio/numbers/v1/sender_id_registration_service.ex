# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.SenderIdRegistrationService do
  @moduledoc """
  Create a Sender ID Registration and initialize an embedded session

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Creates a new sender ID registration and initializes an embedded Persona inquiry session. Returns registration details and embedded session credentials for rendering the Compliance Embeddable UI.

  Operation: `CreateSenderIdRegistration` | Tags: NumbersV1SenderIdRegistration
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.SenderIdRegistration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SenderIdRegistrations",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.SenderIdRegistration)}
    end
  end
end
