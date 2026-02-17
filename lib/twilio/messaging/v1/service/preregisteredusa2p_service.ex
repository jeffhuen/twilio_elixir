# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Service.Preregisteredusa2pService do
  @moduledoc """
  Resource to associate preregistered campaign with Messaging Service.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `CreateExternalCampaign` | Tags: MessagingV1ExternalCampaign

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CampaignId` | string | ID of the preregistered campaign. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessagingServiceSid` | string | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) that the resource is associated with. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CnpMigration` | boolean | Customers should use this flag during the ERC registration process to indicate to Twilio that the campaign being registered is undergoing CNP migration. It is important for the user to first trigger the CNP migration process for said campaign in their CSP portal and have Twilio accept the sharing request, before making this api call. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.Preregisteredusa2p.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/PreregisteredUsa2p",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service.Preregisteredusa2p)}
    end
  end
end
