# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V2.Flow.FlowRevisionService do
  @moduledoc """
  Studio flows revisions

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Flows revisions.

  Operation: `ListFlowRevision` | Tags: StudioV2FlowRevision
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Flows/#{sid}/Revisions",
           params: params,
           opts: opts,
           base_url: "https://studio.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "revisions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Studio.V2.Flow.FlowRevision
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Flows revisions. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, sid, Map.merge(params, page_opts), opts)
      end,
      "revisions"
    )
  end

  @doc """
  Retrieve a specific Flow revision.

  Operation: `FetchFlowRevision` | Tags: StudioV2FlowRevision
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.FlowRevision.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Flows/#{sid}/Revisions/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow.FlowRevision)}
    end
  end
end
