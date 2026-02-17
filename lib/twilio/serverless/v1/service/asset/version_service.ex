# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.Asset.VersionService do
  @moduledoc """
  The content of an Asset.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Asset Versions.

  Operation: `ListAssetVersion` | Tags: ServerlessV1AssetVersion
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, asset_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Assets/#{asset_sid}/Versions",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "asset_versions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Asset.Version
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Asset Versions. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, asset_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, asset_sid, Map.merge(params, page_opts), opts)
      end,
      "asset_versions"
    )
  end

  @doc """
  Retrieve a specific Asset Version.

  Operation: `FetchAssetVersion` | Tags: ServerlessV1AssetVersion
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Asset.Version.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, asset_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Assets/#{asset_sid}/Versions/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Asset.Version)}
    end
  end
end
