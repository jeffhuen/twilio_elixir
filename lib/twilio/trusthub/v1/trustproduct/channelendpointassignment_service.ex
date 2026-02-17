# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.Trustproduct.ChannelendpointassignmentService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Assigned Items for an account.

  Operation: `ListTrustProductChannelEndpointAssignment` | Tags: TrusthubV1TrustProductsChannelEndpointAssignment

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChannelEndpointSid` | string | The SID of an channel endpoint |
  | `ChannelEndpointSids` | string | comma separated list of channel endpoint sids |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, trust_product_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/TrustProducts/#{trust_product_sid}/ChannelEndpointAssignments",
           params: params,
           opts: opts,
           base_url: "https://trusthub.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trusthub.V1.Trustproduct.Channelendpointassignment
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Assigned Items for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, trust_product_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, trust_product_sid, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Assigned Item.

  Operation: `CreateTrustProductChannelEndpointAssignment` | Tags: TrusthubV1TrustProductsChannelEndpointAssignment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChannelEndpointSid` | string | The SID of an channel endpoint |
  | `ChannelEndpointType` | string | The type of channel endpoint. eg: phone-number |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Trustproduct.Channelendpointassignment.t()}
          | {:error, Twilio.Error.t()}
  def create(client, trust_product_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/TrustProducts/#{trust_product_sid}/ChannelEndpointAssignments",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Trustproduct.Channelendpointassignment
       )}
    end
  end

  @doc """
  Fetch specific Assigned Item Instance.

  Operation: `FetchTrustProductChannelEndpointAssignment` | Tags: TrusthubV1TrustProductsChannelEndpointAssignment
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Trustproduct.Channelendpointassignment.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, trust_product_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/TrustProducts/#{trust_product_sid}/ChannelEndpointAssignments/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Trustproduct.Channelendpointassignment
       )}
    end
  end

  @doc """
  Remove an Assignment Item Instance.

  Operation: `DeleteTrustProductChannelEndpointAssignment` | Tags: TrusthubV1TrustProductsChannelEndpointAssignment
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, trust_product_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/TrustProducts/#{trust_product_sid}/ChannelEndpointAssignments/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
