# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Account.Provision.StatusService do
  @moduledoc """
  Status for email provisioning

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchProvisioningStatus` | Tags: FlexV1ProvisioningStatus
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Account.Provision.Status.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/account/provision/status",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Account.Provision.Status)}
    end
  end
end
