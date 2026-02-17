# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Linkshortening.Domain.ConfigService do
  @moduledoc """
  Service for Config API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchDomainConfig` | Tags: MessagingV1DomainConfig
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Linkshortening.Domain.Config.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, domain_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/LinkShortening/Domains/#{domain_sid}/Config",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Linkshortening.Domain.Config)}
    end
  end

  @doc """


  Operation: `UpdateDomainConfig` | Tags: MessagingV1DomainConfig

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackUrl` | string (uri) | URL to receive click events to your webhook whenever the recipients click on the shortened links |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContinueOnFailure` | boolean | Boolean field to set customer delivery preference when there is a failure in linkShortening service |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DisableHttps` | boolean | Customer's choice to send links with/without "https://" attached to shortened url. If true, messages will not be sent with https:// at the beginning of the url. If false, messages will be sent with https:// at the beginning of the url. False is the default behavior if it is not specified. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackUrl` | string (uri) | Any requests we receive to this domain that do not match an existing shortened message will be redirected to the fallback url. These will likely be either expired messages, random misdirected traffic, or intentional scraping. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Linkshortening.Domain.Config.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, domain_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/LinkShortening/Domains/#{domain_sid}/Config",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Linkshortening.Domain.Config)}
    end
  end
end
