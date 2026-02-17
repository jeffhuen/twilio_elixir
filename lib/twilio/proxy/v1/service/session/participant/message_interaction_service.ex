# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Proxy.V1.Service.Session.Participant.MessageInteractionService do
  @moduledoc """
  Service for MessageInteraction API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListMessageInteraction` | Tags: ProxyV1MessageInteraction
  """
  @spec list(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, service_sid, session_sid, participant_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants/#{participant_sid}/MessageInteractions",
           params: params,
           opts: opts,
           base_url: "https://proxy.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "interactions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Proxy.V1.Service.Session.Participant.MessageInteraction
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, session_sid, participant_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(
          client,
          service_sid,
          session_sid,
          participant_sid,
          Map.merge(params, page_opts),
          opts
        )
      end,
      "interactions"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create a new message Interaction to send directly from your system to one [Participant](https://www.twilio.com/docs/proxy/api/participant).  The `inbound` properties for the Interaction will always be empty.

  Operation: `CreateMessageInteraction` | Tags: ProxyV1MessageInteraction

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Body` | string | The message to send to the participant |
  | `MediaUrl` | array | Reserved. Not currently supported. |
  """
  @spec create(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.Participant.MessageInteraction.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, session_sid, participant_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants/#{participant_sid}/MessageInteractions",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Proxy.V1.Service.Session.Participant.MessageInteraction
       )}
    end
  end

  @doc """


  Operation: `FetchMessageInteraction` | Tags: ProxyV1MessageInteraction
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.Participant.MessageInteraction.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, session_sid, participant_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants/#{participant_sid}/MessageInteractions/#{sid}",
             opts: opts,
             base_url: "https://proxy.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Proxy.V1.Service.Session.Participant.MessageInteraction
       )}
    end
  end
end
