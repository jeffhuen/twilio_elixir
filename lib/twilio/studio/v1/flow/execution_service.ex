# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.Flow.ExecutionService do
  @moduledoc """
  Executions of Studio flows

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Executions for the Flow.

  Operation: `ListExecution` | Tags: StudioV1Execution

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedFrom` | string (date-time) | Only show Execution resources starting on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedTo` | string (date-time) | Only show Execution resources starting before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, flow_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Flows/#{flow_sid}/Executions",
           params: params,
           opts: opts,
           base_url: "https://studio.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "executions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Studio.V1.Flow.Execution
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Executions for the Flow. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, flow_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, flow_sid, Map.merge(params, page_opts), opts)
      end,
      "executions"
    )
  end

  @doc """
  Triggers a new Execution for the Flow

  Operation: `CreateExecution` | Tags: StudioV1Execution

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `From` | string (phone-number) | The Twilio phone number to send messages or initiate calls from during the Flow's Execution. Available as variable `{{flow.channel.address}}`. For SMS, this can also be a Messaging Service SID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `To` | string (phone-number) | The Contact phone number to start a Studio Flow Execution, available as variable `{{contact.channel.address}}`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Parameters` | string | JSON data that will be added to the Flow's context and that can be accessed as variables inside your Flow. For example, if you pass in `Parameters={"name":"Zeke"}`, a widget in your Flow can reference the variable `{{flow.data.name}}`, which returns "Zeke". Note: the JSON value must explicitly be passed as a string, not as a hash object. Depending on your particular HTTP library, you may need to add quotes or URL encode the JSON string. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Execution.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, flow_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Flows/#{flow_sid}/Executions",
             params: params,
             opts: opts,
             base_url: "https://studio.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Execution)}
    end
  end

  @doc """
  Retrieve an Execution

  Operation: `FetchExecution` | Tags: StudioV1Execution
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Execution.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Flows/#{flow_sid}/Executions/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Execution)}
    end
  end

  @doc """
  Update the status of an Execution to `ended`.

  Operation: `UpdateExecution` | Tags: StudioV1Execution

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `active`, `ended` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Execution.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, flow_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Flows/#{flow_sid}/Executions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://studio.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Execution)}
    end
  end

  @doc """
  Delete the Execution and all Steps relating to it.

  Operation: `DeleteExecution` | Tags: StudioV1Execution
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, flow_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Flows/#{flow_sid}/Executions/#{sid}",
      opts: opts,
      base_url: "https://studio.twilio.com"
    )
  end
end
