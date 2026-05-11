# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V3.ControlPlane.Operator.VersionService do
  @moduledoc """
  Service for Version API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a paginated list of all versions for a given Language Operator.

  Operation: `ListOperatorVersions` | Tags: Operators

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | The maximum number of resources to return |
  | `pageToken` | string | Token for pagination |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v3/ControlPlane/Operators/#{id}/Versions",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V3.ControlPlane.Operator.Version
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a paginated list of all versions for a given Language Operator. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, id, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  Fetch a Version.

  Operation: `FetchOperatorVersion` | Tags: Operators
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V3.ControlPlane.Operator.Version.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v3/ControlPlane/Operators/#{id}/Versions/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Intelligence.V3.ControlPlane.Operator.Version
       )}
    end
  end
end
