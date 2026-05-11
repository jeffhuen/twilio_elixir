# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V3.ControlPlane.ConfigurationService do
  @moduledoc """
  Service for Configuration API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List Configuration resources.

  Operation: `ListConfigurations` | Tags: Configurations

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | The maximum number of resources to return |
  | `pageToken` | string | Token for pagination |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v3/ControlPlane/Configurations",
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
                 Twilio.Resources.Intelligence.V3.ControlPlane.Configuration
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream all resources with lazy auto-pagination."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  Create an Intelligence Configuration to control how and when language operators analyze conversations.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  You must include the `rules` field in the request. You can pass an empty array (`"rules": []`), but an Intelligence Configuration with an empty `rules` array doesn't execute any language operators. To add rules later, make a `PUT /v3/ControlPlane/Configurations/{id}` request.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  After creating an Intelligence Configuration, you must attach it to a Conversations Configuration by using the Conversations API.


  Operation: `CreateConfiguration` | Tags: Configurations

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `displayName` | string | The display name of the Intelligence Configuration describing its purpose. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rules` | array | List of Intelligence Configuration Rules that govern when and how Language Operators run. Each Rule represents a bundle of Operators, Triggers, Context, and Actions to be executed by the Intelligence Configuration on a Conversation. A maximum of five (5) Rules are allowed per Intelligence Configuration.  To create an Intelligence Configuration without any Rules configured yet, pass an empty array (`"rules": []`). The Configuration will not execute any Language Operators until at least one Rule has been added.  |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `description` | string | The description of the Intelligence Configuration further explaining its purpose. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V3.ControlPlane.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v3/ControlPlane/Configurations",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Intelligence.V3.ControlPlane.Configuration)}
    end
  end

  @doc """
  Fetch a Configuration.

  Operation: `FetchConfiguration` | Tags: Configurations
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V3.ControlPlane.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v3/ControlPlane/Configurations/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Intelligence.V3.ControlPlane.Configuration)}
    end
  end

  @doc """
  Delete a Configuration.

  Operation: `DeleteConfiguration` | Tags: Configurations
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v3/ControlPlane/Configurations/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
