# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Proxy.V1.Service.Session.ParticipantService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Participants in a Session.

  Operation: `ListParticipant` | Tags: ProxyV1Participant
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, session_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants",
           params: params,
           opts: opts,
           base_url: "https://proxy.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "participants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Proxy.V1.Service.Session.Participant
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Participants in a Session. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, session_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, session_sid, Map.merge(params, page_opts), opts)
      end,
      "participants"
    )
  end

  @doc """
  Add a new Participant to the Session

  Operation: `CreateParticipant` | Tags: ProxyV1Participant

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identifier` | string | The phone number of the Participant. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the participant. This value must be 255 characters or fewer. **This value should not have PII.** |
  | `ProxyIdentifier` | string | The proxy phone number to use for the Participant. If not specified, Proxy will select a number from the pool. |
  | `ProxyIdentifierSid` | string | The SID of the Proxy Identifier to assign to the Participant. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.Participant.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, session_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Session.Participant)}
    end
  end

  @doc """
  Fetch a specific Participant.

  Operation: `FetchParticipant` | Tags: ProxyV1Participant
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.Participant.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, session_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants/#{sid}",
             opts: opts,
             base_url: "https://proxy.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Session.Participant)}
    end
  end

  @doc """
  Delete a specific Participant. This is a soft-delete. The participant remains associated with the session and cannot be re-added. Participants are only permanently deleted when the [Session](https://www.twilio.com/docs/proxy/api/session) is deleted.

  Operation: `DeleteParticipant` | Tags: ProxyV1Participant
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, session_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Sessions/#{session_sid}/Participants/#{sid}",
      opts: opts,
      base_url: "https://proxy.twilio.com"
    )
  end
end
