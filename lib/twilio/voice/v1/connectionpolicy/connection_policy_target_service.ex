# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.Connectionpolicy.ConnectionPolicyTargetService do
  @moduledoc """
  Network element entry points into your communications infrastructure

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListConnectionPolicyTarget` | Tags: VoiceV1ConnectionPolicyTarget
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, connection_policy_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ConnectionPolicies/#{connection_policy_sid}/Targets",
           params: params,
           opts: opts,
           base_url: "https://voice.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "targets")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, connection_policy_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, connection_policy_sid, Map.merge(params, page_opts), opts)
      end,
      "targets"
    )
  end

  @doc """


  Operation: `CreateConnectionPolicyTarget` | Tags: VoiceV1ConnectionPolicyTarget

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Target` | string (uri) | The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | Whether the Target is enabled. The default is `true`. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long. |
  | `Priority` | integer | The relative importance of the target. Can be an integer from 0 to 65535, inclusive, and the default is 10. The lowest number represents the most important target. |
  | `Weight` | integer | The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive, and the default is 10. Targets with higher values receive more load than those with lower ones with the same priority. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget.t()}
          | {:error, Twilio.Error.t()}
  def create(client, connection_policy_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/ConnectionPolicies/#{connection_policy_sid}/Targets",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget
       )}
    end
  end

  @doc """


  Operation: `FetchConnectionPolicyTarget` | Tags: VoiceV1ConnectionPolicyTarget
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, connection_policy_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/ConnectionPolicies/#{connection_policy_sid}/Targets/#{sid}",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget
       )}
    end
  end

  @doc """


  Operation: `UpdateConnectionPolicyTarget` | Tags: VoiceV1ConnectionPolicyTarget

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | Whether the Target is enabled. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long. |
  | `Priority` | integer | The relative importance of the target. Can be an integer from 0 to 65535, inclusive. The lowest number represents the most important target. |
  | `Target` | string (uri) | The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported. |
  | `Weight` | integer | The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive. Targets with higher values receive more load than those with lower ones with the same priority. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget.t()}
          | {:error, Twilio.Error.t()}
  def update(client, connection_policy_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/ConnectionPolicies/#{connection_policy_sid}/Targets/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Voice.V1.Connectionpolicy.ConnectionPolicyTarget
       )}
    end
  end

  @doc """


  Operation: `DeleteConnectionPolicyTarget` | Tags: VoiceV1ConnectionPolicyTarget
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, connection_policy_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/ConnectionPolicies/#{connection_policy_sid}/Targets/#{sid}",
      opts: opts,
      base_url: "https://voice.twilio.com"
    )
  end
end
