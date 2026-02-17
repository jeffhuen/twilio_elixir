# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.Consent.BulkConsentsService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `CreateBulkConsents` | Tags: AccountsV1BulkConsents

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Items` | array | This is a list of objects that describes a contact's opt-in status. Each object contains the following fields: `contact_id`, which must be a string representing phone number in [E.164 format](https://www.twilio.com/docs/glossary/what-e164); `correlation_id`, a unique 32-character UUID used to uniquely map the request item with the response item; `sender_id`, which can be either a valid messaging service SID or a from phone number; `status`, a string representing the consent status. Can be one of [`opt-in`, `opt-out`]; `source`, a string indicating the medium through which the consent was collected. Can be one of [`website`, `offline`, `opt-in-message`, `opt-out-message`, `others`]; `date_of_consent`, an optional datetime string field in ISO-8601 format that captures the exact date and time when the user gave or revoked consent. If not provided, it will be empty. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.Consent.BulkConsents.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Consents/Bulk",
             params: params,
             opts: opts,
             base_url: "https://accounts.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.Consent.BulkConsents)}
    end
  end
end
