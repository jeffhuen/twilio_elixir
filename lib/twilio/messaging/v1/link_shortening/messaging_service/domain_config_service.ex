# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.LinkShortening.MessagingService.DomainConfigService do
  @moduledoc """
  Service for DomainConfig API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchDomainConfigMessagingService` | Tags: MessagingV1DomainConfigMessagingService
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.LinkShortening.MessagingService.DomainConfig.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, messaging_service_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/LinkShortening/MessagingService/#{messaging_service_sid}/DomainConfig",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.LinkShortening.MessagingService.DomainConfig
       )}
    end
  end
end
