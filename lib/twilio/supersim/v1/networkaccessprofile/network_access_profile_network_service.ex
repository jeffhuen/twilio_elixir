# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.Networkaccessprofile.NetworkAccessProfileNetworkService do
  @moduledoc """
  Mobile operator networks which Network Access Profiles allow access to

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Network Access Profile resource's Network resource.

  Operation: `ListNetworkAccessProfileNetwork` | Tags: SupersimV1NetworkAccessProfileNetwork
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, network_access_profile_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/NetworkAccessProfiles/#{network_access_profile_sid}/Networks",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "networks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Supersim.V1.Networkaccessprofile.NetworkAccessProfileNetwork
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Network Access Profile resource's Network resource. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, network_access_profile_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, network_access_profile_sid, Map.merge(params, page_opts), opts)
      end,
      "networks"
    )
  end

  @doc """
  Add a Network resource to the Network Access Profile resource.

  Operation: `CreateNetworkAccessProfileNetwork` | Tags: SupersimV1NetworkAccessProfileNetwork

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Network` | string | The SID of the Network resource to be added to the Network Access Profile resource. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Networkaccessprofile.NetworkAccessProfileNetwork.t()}
          | {:error, Twilio.Error.t()}
  def create(client, network_access_profile_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/NetworkAccessProfiles/#{network_access_profile_sid}/Networks",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Supersim.V1.Networkaccessprofile.NetworkAccessProfileNetwork
       )}
    end
  end

  @doc """
  Fetch a Network Access Profile resource's Network resource.

  Operation: `FetchNetworkAccessProfileNetwork` | Tags: SupersimV1NetworkAccessProfileNetwork
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Networkaccessprofile.NetworkAccessProfileNetwork.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, network_access_profile_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/NetworkAccessProfiles/#{network_access_profile_sid}/Networks/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Supersim.V1.Networkaccessprofile.NetworkAccessProfileNetwork
       )}
    end
  end

  @doc """
  Remove a Network resource from the Network Access Profile resource's.

  Operation: `DeleteNetworkAccessProfileNetwork` | Tags: SupersimV1NetworkAccessProfileNetwork
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, network_access_profile_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/NetworkAccessProfiles/#{network_access_profile_sid}/Networks/#{sid}",
      opts: opts,
      base_url: "https://supersim.twilio.com"
    )
  end
end
