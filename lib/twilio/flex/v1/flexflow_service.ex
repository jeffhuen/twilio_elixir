# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.FlexflowService do
  @moduledoc """
  Flex Flow

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListFlexFlow` | Tags: FlexV1FlexFlow

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The `friendly_name` of the Flex Flow resources to read. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/FlexFlows",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "flex_flows")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Flex.V1.Flexflow)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "flex_flows"
    )
  end

  @doc """


  Operation: `CreateFlexFlow` | Tags: FlexV1FlexFlow

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChannelType` | string |  Values: `web`, `sms`, `facebook`, `whatsapp`, `line`, `custom` |
  | `ChatServiceSid` | string | The SID of the chat service. |
  | `FriendlyName` | string | A descriptive string that you create to describe the Flex Flow resource. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ContactIdentity` | string | The channel contact's Identity. |
  | `Enabled` | boolean | Whether the new Flex Flow is enabled. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.Channel` | string | The Task Channel SID (TCXXXX) or unique name (e.g., `sms`) to use for the Task that will be created. Applicable and required when `integrationType` is `task`. The default value is `default`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.CreationOnMessage` | boolean | In the context of outbound messaging, defines whether to create a Task immediately (and therefore reserve the conversation to current agent), or delay Task creation until the customer sends the first response. Set to false to create immediately, true to delay Task creation. This setting is only applicable for outbound messaging. |
  | `Integration.FlowSid` | string | The SID of the Studio Flow. Required when `integrationType` is `studio`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.Priority` | integer | The Task priority of a new Task. The default priority is 0. Optional when `integrationType` is `task`, not applicable otherwise. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.RetryCount` | integer | The number of times to retry the Studio Flow or webhook in case of failure. Takes integer values from 0 to 3 with the default being 3. Optional when `integrationType` is `studio` or `external`, not applicable otherwise. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.Timeout` | integer | The Task timeout in seconds for a new Task. Default is 86,400 seconds (24 hours). Optional when `integrationType` is `task`, not applicable otherwise. |
  | `Integration.Url` | string (uri) | The URL of the external webhook. Required when `integrationType` is `external`. |
  | `Integration.WorkflowSid` | string | The Workflow SID for a new Task. Required when `integrationType` is `task`. |
  | `Integration.WorkspaceSid` | string | The Workspace SID for a new Task. Required when `integrationType` is `task`. |
  | `IntegrationType` | string |  Values: `studio`, `external`, `task` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `JanitorEnabled` | boolean | When enabled, the Messaging Channel Janitor will remove active Proxy sessions if the associated Task is deleted outside of the Flex UI. Defaults to `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `LongLived` | boolean | When enabled, Flex will keep the chat channel active so that it may be used for subsequent interactions with a contact identity. Defaults to `false`. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Flexflow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/FlexFlows",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Flexflow)}
    end
  end

  @doc """


  Operation: `FetchFlexFlow` | Tags: FlexV1FlexFlow
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Flexflow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/FlexFlows/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Flexflow)}
    end
  end

  @doc """


  Operation: `UpdateFlexFlow` | Tags: FlexV1FlexFlow

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChannelType` | string |  Values: `web`, `sms`, `facebook`, `whatsapp`, `line`, `custom` |
  | `ChatServiceSid` | string | The SID of the chat service. |
  | `ContactIdentity` | string | The channel contact's Identity. |
  | `Enabled` | boolean | Whether the new Flex Flow is enabled. |
  | `FriendlyName` | string | A descriptive string that you create to describe the Flex Flow resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.Channel` | string | The Task Channel SID (TCXXXX) or unique name (e.g., `sms`) to use for the Task that will be created. Applicable and required when `integrationType` is `task`. The default value is `default`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.CreationOnMessage` | boolean | In the context of outbound messaging, defines whether to create a Task immediately (and therefore reserve the conversation to current agent), or delay Task creation until the customer sends the first response. Set to false to create immediately, true to delay Task creation. This setting is only applicable for outbound messaging. |
  | `Integration.FlowSid` | string | The SID of the Studio Flow. Required when `integrationType` is `studio`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.Priority` | integer | The Task priority of a new Task. The default priority is 0. Optional when `integrationType` is `task`, not applicable otherwise. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.RetryCount` | integer | The number of times to retry the Studio Flow or webhook in case of failure. Takes integer values from 0 to 3 with the default being 3. Optional when `integrationType` is `studio` or `external`, not applicable otherwise. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Integration.Timeout` | integer | The Task timeout in seconds for a new Task. Default is 86,400 seconds (24 hours). Optional when `integrationType` is `task`, not applicable otherwise. |
  | `Integration.Url` | string (uri) | The URL of the external webhook. Required when `integrationType` is `external`. |
  | `Integration.WorkflowSid` | string | The Workflow SID for a new Task. Required when `integrationType` is `task`. |
  | `Integration.WorkspaceSid` | string | The Workspace SID for a new Task. Required when `integrationType` is `task`. |
  | `IntegrationType` | string |  Values: `studio`, `external`, `task` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `JanitorEnabled` | boolean | When enabled, the Messaging Channel Janitor will remove active Proxy sessions if the associated Task is deleted outside of the Flex UI. Defaults to `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `LongLived` | boolean | When enabled, Flex will keep the chat channel active so that it may be used for subsequent interactions with a contact identity. Defaults to `false`. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Flexflow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/FlexFlows/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Flexflow)}
    end
  end

  @doc """


  Operation: `DeleteFlexFlow` | Tags: FlexV1FlexFlow
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/FlexFlows/#{sid}",
      opts: opts,
      base_url: "https://flex-api.twilio.com"
    )
  end
end
