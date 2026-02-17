# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.RegulatoryCompliance.Bundle.CloneService do
  @moduledoc """
  Service for Clone API operations.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Creates a new clone of the Bundle in target Account. It will internally create clones of all the bundle items (identities and documents) of the original bundle

  Operation: `CreateBundleClone` | Tags: NumbersV2BundleClone

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TargetAccountSid` | string | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) where the bundle needs to be cloned. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the cloned bundle. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MoveToDraft` | boolean | If set to true, the cloned bundle will be in the DRAFT state, else it will be twilio-approved |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.Clone.t()}
          | {:ok, map(), map()}
          | :ok
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
         Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.Clone
       )}
    end
  end
end
