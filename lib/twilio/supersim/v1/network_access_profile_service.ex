# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.NetworkAccessProfileService do
  @moduledoc """
  Service for NetworkAccessProfile API operations.

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Network Access Profiles from your account.

  Operation: `ListNetworkAccessProfile` | Tags: SupersimV1NetworkAccessProfile
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/NetworkAccessProfiles",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "network_access_profiles")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Supersim.V1.NetworkAccessProfile
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Network Access Profiles from your account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "network_access_profiles"
    )
  end

  @doc """
  Create a new Network Access Profile

  Operation: `CreateNetworkAccessProfile` | Tags: SupersimV1NetworkAccessProfile

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Networks` | array | List of Network SIDs that this Network Access Profile will allow connections to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.NetworkAccessProfile.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/NetworkAccessProfiles",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.NetworkAccessProfile)}
    end
  end

  @doc """
  Fetch a Network Access Profile instance from your account.

  Operation: `FetchNetworkAccessProfile` | Tags: SupersimV1NetworkAccessProfile
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.NetworkAccessProfile.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/NetworkAccessProfiles/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.NetworkAccessProfile)}
    end
  end

  @doc """
  Updates the given properties of a Network Access Profile in your account.

  Operation: `UpdateNetworkAccessProfile` | Tags: SupersimV1NetworkAccessProfile

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UniqueName` | string | The new unique name of the Network Access Profile. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.NetworkAccessProfile.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/NetworkAccessProfiles/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.NetworkAccessProfile)}
    end
  end
end
