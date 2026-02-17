# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.ActivityService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListActivity` | Tags: TaskrouterV1Activity

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The `friendly_name` of the Activity resources to read. |
  | `Available` | string | Whether return only Activity resources that are available or unavailable. A value of `true` returns only available activities. Values of '1' or `yes` also indicate `true`. All other values represent `false` and return activities that are unavailable. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Activities",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "activities")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Activity
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, workspace_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, workspace_sid, Map.merge(params, page_opts), opts)
      end,
      "activities"
    )
  end

  @doc """


  Operation: `CreateActivity` | Tags: TaskrouterV1Activity

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the Activity resource. It can be up to 64 characters long. These names are used to calculate and expose statistics about Workers, and provide visibility into the state of each Worker. Examples of friendly names include: `on-call`, `break`, and `email`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Available` | boolean | Whether the Worker should be eligible to receive a Task when it occupies the Activity. A value of `true`, `1`, or `yes` specifies the Activity is available. All other values specify that it is not. The value cannot be changed after the Activity is created. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Activity.t()}
          | {:error, Twilio.Error.t()}
  def create(client, workspace_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/Activities",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Activity)}
    end
  end

  @doc """


  Operation: `FetchActivity` | Tags: TaskrouterV1Activity
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Activity.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Activities/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Activity)}
    end
  end

  @doc """


  Operation: `UpdateActivity` | Tags: TaskrouterV1Activity

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the Activity resource. It can be up to 64 characters long. These names are used to calculate and expose statistics about Workers, and provide visibility into the state of each Worker. Examples of friendly names include: `on-call`, `break`, and `email`. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Activity.t()}
          | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/Activities/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Activity)}
    end
  end

  @doc """


  Operation: `DeleteActivity` | Tags: TaskrouterV1Activity
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, workspace_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Workspaces/#{workspace_sid}/Activities/#{sid}",
      opts: opts,
      base_url: "https://taskrouter.twilio.com"
    )
  end
end
