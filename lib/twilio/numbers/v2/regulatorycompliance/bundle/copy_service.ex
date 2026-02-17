# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.Bundle.CopyService do
  @moduledoc """


  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Bundles Copies for a Bundle.

  Operation: `ListBundleCopy` | Tags: NumbersV2BundleCopy
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, bundle_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/Copies",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Copy
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Bundles Copies for a Bundle. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, bundle_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, bundle_sid, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Creates a new copy of a Bundle. It will internally create copies of all the bundle items (identities and documents) of the original bundle

  Operation: `CreateBundleCopy` | Tags: NumbersV2BundleCopy

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the copied bundle. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Copy.t()}
          | {:error, Twilio.Error.t()}
  def create(client, bundle_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/Copies",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Copy
       )}
    end
  end
end
