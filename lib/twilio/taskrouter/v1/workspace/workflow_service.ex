# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.WorkflowService do
  @moduledoc """
  Service for Workflow API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListWorkflow` | Tags: TaskrouterV1Workflow

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The `friendly_name` of the Workflow resources to read. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Workflows",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "workflows")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Workflow
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
      "workflows"
    )
  end

  @doc """


  Operation: `CreateWorkflow` | Tags: TaskrouterV1Workflow

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Configuration` | string | A JSON string that contains the rules to apply to the Workflow. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Workflow resource. For example, `Inbound Call Workflow` or `2014 Outbound Campaign`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AssignmentCallbackUrl` | string (uri) | The URL from your application that will process task assignment events. See [Handling Task Assignment Callback](https://www.twilio.com/docs/taskrouter/handle-assignment-callbacks) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackAssignmentCallbackUrl` | string (uri) | The URL that we should call when a call to the `assignment_callback_url` fails. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TaskReservationTimeout` | integer | How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Workflow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, workspace_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/Workflows",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Workflow)}
    end
  end

  @doc """


  Operation: `FetchWorkflow` | Tags: TaskrouterV1Workflow
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Workflow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Workflows/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Workflow)}
    end
  end

  @doc """


  Operation: `UpdateWorkflow` | Tags: TaskrouterV1Workflow

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AssignmentCallbackUrl` | string (uri) | The URL from your application that will process task assignment events. See [Handling Task Assignment Callback](https://www.twilio.com/docs/taskrouter/handle-assignment-callbacks) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Configuration` | string | A JSON string that contains the rules to apply to the Workflow. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackAssignmentCallbackUrl` | string (uri) | The URL that we should call when a call to the `assignment_callback_url` fails. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Workflow resource. For example, `Inbound Call Workflow` or `2014 Outbound Campaign`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ReEvaluateTasks` | string | Whether or not to re-evaluate Tasks. The default is `false`, which means Tasks in the Workflow will not be processed through the assignment loop again. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TaskReservationTimeout` | integer | How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Workflow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/Workflows/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Workflow)}
    end
  end

  @doc """


  Operation: `DeleteWorkflow` | Tags: TaskrouterV1Workflow
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, workspace_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Workspaces/#{workspace_sid}/Workflows/#{sid}",
      opts: opts,
      base_url: "https://taskrouter.twilio.com"
    )
  end
end
