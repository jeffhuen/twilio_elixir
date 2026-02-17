# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.LinkShortening.Domain.RequestManagedCertService do
  @moduledoc """
  Service for RequestManagedCert API operations.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `UpdateRequestManagedCert` | Tags: MessagingV1RequestManagedCert
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.LinkShortening.Domain.RequestManagedCert.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, domain_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/LinkShortening/Domains/#{domain_sid}/RequestManagedCert",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Messaging.V1.LinkShortening.Domain.RequestManagedCert
       )}
    end
  end
end
