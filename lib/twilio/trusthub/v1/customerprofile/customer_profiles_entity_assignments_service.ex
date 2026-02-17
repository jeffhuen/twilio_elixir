# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.Customerprofile.CustomerProfilesEntityAssignmentsService do
  @moduledoc """
  Service for CustomerProfilesEntityAssignments API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Assigned Items for an account.

  Operation: `ListCustomerProfileEntityAssignment` | Tags: TrusthubV1CustomerProfilesEntityAssignments

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ObjectType` | string | A string to filter the results by (EndUserType or SupportingDocumentType) machine-name. This is useful when you want to retrieve the entity-assignment of a specific end-user or supporting document. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, customer_profile_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/CustomerProfiles/#{customer_profile_sid}/EntityAssignments",
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
                 Twilio.Resources.Trusthub.V1.Customerprofile.CustomerProfilesEntityAssignments
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

  Operation: `CreateCustomerProfileEntityAssignment` | Tags: TrusthubV1CustomerProfilesEntityAssignments

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ObjectSid` | string | The SID of an object bag that holds information of the different items. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok,
           Twilio.Resources.Trusthub.V1.Customerprofile.CustomerProfilesEntityAssignments.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, customer_profile_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/CustomerProfiles/#{customer_profile_sid}/EntityAssignments",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Customerprofile.CustomerProfilesEntityAssignments
       )}
    end
  end

  @doc """
  Fetch specific Assigned Item Instance.

  Operation: `FetchCustomerProfileEntityAssignment` | Tags: TrusthubV1CustomerProfilesEntityAssignments
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok,
           Twilio.Resources.Trusthub.V1.Customerprofile.CustomerProfilesEntityAssignments.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, customer_profile_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/CustomerProfiles/#{customer_profile_sid}/EntityAssignments/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Customerprofile.CustomerProfilesEntityAssignments
       )}
    end
  end

  @doc """
  Remove an Assignment Item Instance.

  Operation: `DeleteCustomerProfileEntityAssignment` | Tags: TrusthubV1CustomerProfilesEntityAssignments
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, customer_profile_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/CustomerProfiles/#{customer_profile_sid}/EntityAssignments/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
