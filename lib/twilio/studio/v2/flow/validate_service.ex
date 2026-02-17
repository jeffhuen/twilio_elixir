# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V2.Flow.ValidateService do
  @moduledoc """
  Flow definition validator

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Validate flow JSON definition

  Operation: `UpdateFlowValidate` | Tags: StudioV2FlowValidate

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Definition` | string | JSON representation of flow definition. |
  | `FriendlyName` | string | The string that you assigned to describe the Flow. |
  | `Status` | string |  Values: `draft`, `published` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CommitMessage` | string | Description of change made in the revision. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.Validate.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Flows/Validate",
             params: params,
             opts: opts,
             base_url: "https://studio.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow.Validate)}
    end
  end
end
