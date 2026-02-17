# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.ConfigurationService do
  @moduledoc """
  Configuration for a Flex instance

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchConfiguration` | Tags: FlexV1Configuration

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UiVersion` | string | The Pinned UI version of the Configuration resource to fetch. |
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Configuration.t()} | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Configuration",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Configuration)}
    end
  end

  @doc """


  Operation: `UpdateConfiguration` | Tags: FlexV1Configuration
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Configuration.t()} | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Configuration",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Configuration)}
    end
  end
end
