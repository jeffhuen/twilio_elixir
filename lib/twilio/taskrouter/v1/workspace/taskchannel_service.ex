# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.TaskchannelService do
  @moduledoc """
  Types of tasks

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListTaskChannel` | Tags: TaskrouterV1TaskChannel
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/TaskChannels",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "channels")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel
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
      "channels"
    )
  end

  @doc """


  Operation: `CreateTaskChannel` | Tags: TaskrouterV1TaskChannel

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Task Channel. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the Task Channel, such as `voice` or `sms`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ChannelOptimizedRouting` | boolean | Whether the Task Channel should prioritize Workers that have been idle. If `true`, Workers that have been idle the longest are prioritized. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, workspace_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/TaskChannels",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel)}
    end
  end

  @doc """


  Operation: `FetchTaskChannel` | Tags: TaskrouterV1TaskChannel
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/TaskChannels/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel)}
    end
  end

  @doc """


  Operation: `UpdateTaskChannel` | Tags: TaskrouterV1TaskChannel

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ChannelOptimizedRouting` | boolean | Whether the TaskChannel should prioritize Workers that have been idle. If `true`, Workers that have been idle the longest are prioritized. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Task Channel. It can be up to 64 characters long. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/TaskChannels/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel)}
    end
  end

  @doc """


  Operation: `DeleteTaskChannel` | Tags: TaskrouterV1TaskChannel
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, workspace_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Workspaces/#{workspace_sid}/TaskChannels/#{sid}",
      opts: opts,
      base_url: "https://taskrouter.twilio.com"
    )
  end
end
