# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.SourceipmappingService do
  @moduledoc """
  With Source IP Mappings, Twilio can recognize your SIP requests based on where they are sent from. The Request-URI no longer has to have the FQDN (Fully Qualified Domain Name) of your SIP Domain.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListSourceIpMapping` | Tags: VoiceV1SourceIpMapping
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/SourceIpMappings",
           params: params,
           opts: opts,
           base_url: "https://voice.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "source_ip_mappings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Voice.V1.Sourceipmapping
               )
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
      "source_ip_mappings"
    )
  end

  @doc """


  Operation: `CreateSourceIpMapping` | Tags: VoiceV1SourceIpMapping

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IpRecordSid` | string | The Twilio-provided string that uniquely identifies the IP Record resource to map from. |
  | `SipDomainSid` | string | The SID of the SIP Domain that the IP Record should be mapped to. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Sourceipmapping.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SourceIpMappings",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Sourceipmapping)}
    end
  end

  @doc """


  Operation: `FetchSourceIpMapping` | Tags: VoiceV1SourceIpMapping
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Sourceipmapping.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/SourceIpMappings/#{sid}",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Sourceipmapping)}
    end
  end

  @doc """


  Operation: `UpdateSourceIpMapping` | Tags: VoiceV1SourceIpMapping

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SipDomainSid` | string | The SID of the SIP Domain that the IP Record should be mapped to. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Sourceipmapping.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SourceIpMappings/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Sourceipmapping)}
    end
  end

  @doc """


  Operation: `DeleteSourceIpMapping` | Tags: VoiceV1SourceIpMapping
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/SourceIpMappings/#{sid}",
      opts: opts,
      base_url: "https://voice.twilio.com"
    )
  end
end
