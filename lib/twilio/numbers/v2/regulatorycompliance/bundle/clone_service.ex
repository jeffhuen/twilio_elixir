# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.Bundle.CloneService do
  @moduledoc """


  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Creates a new clone of the Bundle in target Account. It will internally create clones of all the bundle items (identities and documents) of the original bundle

  Operation: `CreateBundleClone` | Tags: NumbersV2BundleClone

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TargetAccountSid` | string | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) where the bundle needs to be cloned. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the cloned bundle. |
  | `MoveToDraft` | boolean | If set to true, the cloned bundle will be in the DRAFT state, else it will be twilio-approved |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Clone.t()}
          | {:error, Twilio.Error.t()}
  def update(client, bundle_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/Clones",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Clone
       )}
    end
  end
end
