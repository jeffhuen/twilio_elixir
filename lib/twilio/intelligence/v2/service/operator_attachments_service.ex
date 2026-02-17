# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.Service.OperatorAttachmentsService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve Operators attached to a Service.

  Operation: `FetchOperatorAttachments` | Tags: IntelligenceV2OperatorAttachments
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Service.OperatorAttachments.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{service_sid}/Operators",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Intelligence.V2.Service.OperatorAttachments
       )}
    end
  end
end
