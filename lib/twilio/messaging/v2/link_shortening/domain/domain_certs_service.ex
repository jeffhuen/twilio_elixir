# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V2.LinkShortening.Domain.DomainCertsService do
  @moduledoc """
  Service for DomainCerts API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchDomainCertV4` | Tags: MessagingV2DomainCerts
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V2.LinkShortening.Domain.DomainCerts.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/LinkShortening/Domains/#{domain_sid}/Certificate",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V2.LinkShortening.Domain.DomainCerts
       )}
    end
  end
end
