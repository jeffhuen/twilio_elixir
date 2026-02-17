# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.Bundle.ReplaceItemsService do
  @moduledoc """
  Service for ReplaceItems API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Replaces all bundle items in the target bundle (specified in the path) with all the bundle items of the source bundle (specified by the from_bundle_sid body param)

  Operation: `CreateReplaceItems` | Tags: NumbersV2ReplaceItems

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FromBundleSid` | string | The source bundle sid to copy the item assignments from. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.ReplaceItems.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, bundle_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/ReplaceItems",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.ReplaceItems
       )}
    end
  end
end
