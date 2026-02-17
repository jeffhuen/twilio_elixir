# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Routes.V2.SipDomainService do
  @moduledoc """
  Service for SipDomain API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchSipDomain` | Tags: RoutesV2SipDomain
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Routes.V2.SipDomain.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/SipDomains/#{sid}",
             opts: opts,
             base_url: "https://routes.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Routes.V2.SipDomain)}
    end
  end

  @doc """


  Operation: `UpdateSipDomain` | Tags: RoutesV2SipDomain

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string |  |
  | `VoiceRegion` | string |  |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Routes.V2.SipDomain.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/SipDomains/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://routes.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Routes.V2.SipDomain)}
    end
  end
end
