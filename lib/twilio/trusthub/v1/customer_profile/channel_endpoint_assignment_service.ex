# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.CustomerProfile.ChannelEndpointAssignmentService do
  @moduledoc """
  Service for ChannelEndpointAssignment API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Assigned Items for an account.

  Operation: `ListCustomerProfileChannelEndpointAssignment` | Tags: TrusthubV1CustomerProfilesChannelEndpointAssignment

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChannelEndpointSid` | string | The SID of an channel endpoint |
  | `ChannelEndpointSids` | string | comma separated list of channel endpoint sids |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, customer_profile_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/CustomerProfiles/#{customer_profile_sid}/ChannelEndpointAssignments",
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
                 Twilio.Resources.Trusthub.V1.CustomerProfile.ChannelEndpointAssignment
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Assigned Items for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, customer_profile_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, customer_profile_sid, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Assigned Item.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Operation: `CreateCustomerProfileChannelEndpointAssignment` | Tags: TrusthubV1CustomerProfilesChannelEndpointAssignment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ChannelEndpointSid` | string | The SID of an channel endpoint |
  | `ChannelEndpointType` | string | The type of channel endpoint. eg: phone-number |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.CustomerProfile.ChannelEndpointAssignment.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, customer_profile_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/CustomerProfiles/#{customer_profile_sid}/ChannelEndpointAssignments",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.CustomerProfile.ChannelEndpointAssignment
       )}
    end
  end

  @doc """
  Fetch specific Assigned Item Instance.

  Operation: `FetchCustomerProfileChannelEndpointAssignment` | Tags: TrusthubV1CustomerProfilesChannelEndpointAssignment
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.CustomerProfile.ChannelEndpointAssignment.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, customer_profile_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/CustomerProfiles/#{customer_profile_sid}/ChannelEndpointAssignments/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.CustomerProfile.ChannelEndpointAssignment
       )}
    end
  end

  @doc """
  Remove an Assignment Item Instance.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Operation: `DeleteCustomerProfileChannelEndpointAssignment` | Tags: TrusthubV1CustomerProfilesChannelEndpointAssignment
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, customer_profile_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/CustomerProfiles/#{customer_profile_sid}/ChannelEndpointAssignments/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
