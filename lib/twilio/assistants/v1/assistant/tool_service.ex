# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Assistants.V1.Assistant.ToolService do
  @moduledoc """
  Service for Tool API operations.

  Operations: `list`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List tools for an Assistant

  Operation: `ListToolsByAssistant`
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, assistant_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Assistants/#{assistant_id}/Tools",
           params: params,
           opts: opts,
           base_url: "https://assistants.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "tools")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Assistants.V1.Assistant.Tool
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List tools for an Assistant (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, assistant_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, assistant_id, Map.merge(params, page_opts), opts)
      end,
      "tools"
    )
  end

  @doc """
  Attach Tool to Assistant

  Operation: `CreateAssistantToolAttachment`
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Assistants.V1.Assistant.Tool.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, assistant_id, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Assistants/#{assistant_id}/Tools/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://assistants.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Assistants.V1.Assistant.Tool)}
    end
  end

  @doc """
  Detach Tool to Assistant

  Operation: `DeleteAssistantToolAttachment`
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, assistant_id, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Assistants/#{assistant_id}/Tools/#{sid}",
      opts: opts,
      base_url: "https://assistants.twilio.com"
    )
  end
end
