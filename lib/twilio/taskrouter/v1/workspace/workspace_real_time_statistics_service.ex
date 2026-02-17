# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.WorkspaceRealTimeStatisticsService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchWorkspaceRealTimeStatistics` | Tags: TaskrouterV1WorkspaceRealTimeStatistics

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TaskChannel` | string | Only calculate real-time statistics on this TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceRealTimeStatistics.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/RealTimeStatistics",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceRealTimeStatistics
       )}
    end
  end
end
