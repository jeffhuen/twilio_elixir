# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.IprecordService do
  @moduledoc """
  IP Records hold information about the IP addresses and ranges ([CIDR](https://tools.ietf.org/html/rfc4632) blocks) that your traffic will be associated with.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListIpRecord` | Tags: VoiceV1IpRecord
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/IpRecords",
           params: params,
           opts: opts,
           base_url: "https://voice.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "ip_records")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Voice.V1.Iprecord)
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
      "ip_records"
    )
  end

  @doc """


  Operation: `CreateIpRecord` | Tags: VoiceV1IpRecord

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IpAddress` | string | An IP address in dotted decimal notation, IPv4 only. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CidrPrefixLength` | integer | An integer representing the length of the [CIDR](https://tools.ietf.org/html/rfc4632) prefix to use with this IP address. By default the entire IP address is used, which for IPv4 is value 32. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Iprecord.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/IpRecords",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Iprecord)}
    end
  end

  @doc """


  Operation: `FetchIpRecord` | Tags: VoiceV1IpRecord
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Iprecord.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/IpRecords/#{sid}",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Iprecord)}
    end
  end

  @doc """


  Operation: `UpdateIpRecord` | Tags: VoiceV1IpRecord

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Iprecord.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/IpRecords/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Iprecord)}
    end
  end

  @doc """


  Operation: `DeleteIpRecord` | Tags: VoiceV1IpRecord
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/IpRecords/#{sid}",
      opts: opts,
      base_url: "https://voice.twilio.com"
    )
  end
end
