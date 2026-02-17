# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Linkshortening.Domain.DomainCertsService do
  @moduledoc """


  Operations: `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchDomainCertV4` | Tags: MessagingV1DomainCerts
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Linkshortening.Domain.DomainCerts.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/LinkShortening/Domains/#{domain_sid}/Certificate",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.Linkshortening.Domain.DomainCerts
       )}
    end
  end

  @doc """


  Operation: `UpdateDomainCertV4` | Tags: MessagingV1DomainCerts

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TlsCert` | string | Contains the full TLS certificate and private for this domain in PEM format: https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail. Twilio uses this information to process HTTPS traffic sent to your domain. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Linkshortening.Domain.DomainCerts.t()}
          | {:error, Twilio.Error.t()}
  def update(client, domain_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/LinkShortening/Domains/#{domain_sid}/Certificate",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.Linkshortening.Domain.DomainCerts
       )}
    end
  end

  @doc """


  Operation: `DeleteDomainCertV4` | Tags: MessagingV1DomainCerts
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, domain_sid, opts \\ []) do
    Client.request(client, :delete, "/v1/LinkShortening/Domains/#{domain_sid}/Certificate",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
