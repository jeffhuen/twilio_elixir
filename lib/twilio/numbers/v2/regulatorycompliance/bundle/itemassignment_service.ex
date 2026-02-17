# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.Bundle.ItemassignmentService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Assigned Items for an account.

  Operation: `ListItemAssignment` | Tags: NumbersV2ItemAssignment
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, bundle_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/ItemAssignments",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Itemassignment
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Assigned Items for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, bundle_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, bundle_sid, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Assigned Item.

  Operation: `CreateItemAssignment` | Tags: NumbersV2ItemAssignment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ObjectSid` | string | The SID of an object bag that holds information of the different items. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Itemassignment.t()}
          | {:error, Twilio.Error.t()}
  def create(client, bundle_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/ItemAssignments",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Itemassignment
       )}
    end
  end

  @doc """
  Fetch specific Assigned Item Instance.

  Operation: `FetchItemAssignment` | Tags: NumbersV2ItemAssignment
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Itemassignment.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, bundle_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/ItemAssignments/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Itemassignment
       )}
    end
  end

  @doc """
  Remove an Assignment Item Instance.

  Operation: `DeleteItemAssignment` | Tags: NumbersV2ItemAssignment
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, bundle_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/ItemAssignments/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
