# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Linkshortening.Messagingservice.DomainService do
  @moduledoc """
  Service for Domain API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Operation: `FetchLinkshorteningMessagingServiceDomainAssociation` | Tags: MessagingV1LinkshorteningMessagingServiceDomainAssociation
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Linkshortening.Messagingservice.Domain.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, messaging_service_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/LinkShortening/MessagingServices/#{messaging_service_sid}/Domain",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.Linkshortening.Messagingservice.Domain
       )}
    end
  end
end
