# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Linkshortening.Domain.ValidatednService do
  @moduledoc """
  Service for Validatedn API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchDomainDnsValidation` | Tags: MessagingV1DomainValidateDns
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Linkshortening.Domain.Validatedn.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/LinkShortening/Domains/#{domain_sid}/ValidateDns",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.Linkshortening.Domain.Validatedn
       )}
    end
  end
end
