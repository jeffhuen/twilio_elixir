# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.LinkShortening.Domain.MessagingServiceService do
  @moduledoc """
  Service for MessagingService API operations.

  Operations: `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `CreateLinkshorteningMessagingService` | Tags: MessagingV1LinkshorteningMessagingService
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.LinkShortening.Domain.MessagingService.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, domain_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/LinkShortening/Domains/#{domain_sid}/MessagingServices/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.LinkShortening.Domain.MessagingService
       )}
    end
  end

  @doc """


  Operation: `DeleteLinkshorteningMessagingService` | Tags: MessagingV1LinkshorteningMessagingService
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, domain_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/LinkShortening/Domains/#{domain_sid}/MessagingServices/#{sid}",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
