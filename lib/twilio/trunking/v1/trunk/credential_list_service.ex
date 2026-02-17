# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trunking.V1.Trunk.CredentialListService do
  @moduledoc """
  List of credentials for accessing a trunk

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListCredentialList` | Tags: TrunkingV1CredentialList
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, trunk_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/CredentialLists",
           params: params,
           opts: opts,
           base_url: "https://trunking.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credential_lists")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trunking.V1.Trunk.CredentialList
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, trunk_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, trunk_sid, Map.merge(params, page_opts), opts)
      end,
      "credential_lists"
    )
  end

  @doc """


  Operation: `CreateCredentialList` | Tags: TrunkingV1CredentialList

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CredentialListSid` | string | The SID of the [Credential List](https://www.twilio.com/docs/voice/sip/api/sip-credentiallist-resource) that you want to associate with the trunk. Once associated, we will authenticate access to the trunk against this list. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.CredentialList.t()}
          | {:error, Twilio.Error.t()}
  def create(client, trunk_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Trunks/#{trunk_sid}/CredentialLists",
             params: params,
             opts: opts,
             base_url: "https://trunking.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.CredentialList)}
    end
  end

  @doc """


  Operation: `FetchCredentialList` | Tags: TrunkingV1CredentialList
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trunking.V1.Trunk.CredentialList.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, trunk_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Trunks/#{trunk_sid}/CredentialLists/#{sid}",
             opts: opts,
             base_url: "https://trunking.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trunking.V1.Trunk.CredentialList)}
    end
  end

  @doc """


  Operation: `DeleteCredentialList` | Tags: TrunkingV1CredentialList
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, trunk_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Trunks/#{trunk_sid}/CredentialLists/#{sid}",
      opts: opts,
      base_url: "https://trunking.twilio.com"
    )
  end
end
