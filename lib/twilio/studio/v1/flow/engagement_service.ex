# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.Flow.EngagementService do
  @moduledoc """
  [DEPRECATED] Excecutions of Studio flows

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Engagements for the Flow.

  Operation: `ListEngagement` | Tags: StudioV1Engagement
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, flow_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Flows/#{flow_sid}/Engagements",
           params: params,
           opts: opts,
           base_url: "https://studio.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "engagements")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Studio.V1.Flow.Engagement
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Engagements for the Flow. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, flow_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, flow_sid, Map.merge(params, page_opts), opts)
      end,
      "engagements"
    )
  end

  @doc """
  Triggers a new Engagement for the Flow

  Operation: `CreateEngagement` | Tags: StudioV1Engagement

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `From` | string (phone-number) | The Twilio phone number to send messages or initiate calls from during the Flow Engagement. Available as variable `{{flow.channel.address}}` |
  | `To` | string (phone-number) | The Contact phone number to start a Studio Flow Engagement, available as variable `{{contact.channel.address}}`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Parameters` | string | A JSON string we will add to your flow's context and that you can access as variables inside your flow. For example, if you pass in `Parameters={'name':'Zeke'}` then inside a widget you can reference the variable `{{flow.data.name}}` which will return the string 'Zeke'. Note: the JSON value must explicitly be passed as a string, not as a hash object. Depending on your particular HTTP library, you may need to add quotes or URL encode your JSON string. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Engagement.t()} | {:error, Twilio.Error.t()}
  def create(client, flow_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Flows/#{flow_sid}/Engagements",
             params: params,
             opts: opts,
             base_url: "https://studio.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Engagement)}
    end
  end

  @doc """
  Retrieve an Engagement

  Operation: `FetchEngagement` | Tags: StudioV1Engagement
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Engagement.t()} | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Flows/#{flow_sid}/Engagements/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Engagement)}
    end
  end

  @doc """
  Delete this Engagement and all Steps relating to it.

  Operation: `DeleteEngagement` | Tags: StudioV1Engagement
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, flow_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Flows/#{flow_sid}/Engagements/#{sid}",
      opts: opts,
      base_url: "https://studio.twilio.com"
    )
  end
end
