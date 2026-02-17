# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.RegulatoryCompliance.EndUserService do
  @moduledoc """
  Service for EndUser API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all End User for an account.

  Operation: `ListEndUser` | Tags: NumbersV2EndUser
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/RegulatoryCompliance/EndUsers",
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
                 Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all End User for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new End User.

  Operation: `CreateEndUser` | Tags: NumbersV2EndUser

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `Type` | string |  Values: `individual`, `business` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | The set of parameters that are the attributes of the End User resource which are derived End User Types. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/EndUsers",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser)}
    end
  end

  @doc """
  Fetch specific End User Instance.

  Operation: `FetchEndUser` | Tags: NumbersV2EndUser
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/RegulatoryCompliance/EndUsers/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser)}
    end
  end

  @doc """
  Update an existing End User.

  Operation: `UpdateEndUser` | Tags: NumbersV2EndUser

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | The set of parameters that are the attributes of the End User resource which are derived End User Types. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/EndUsers/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser)}
    end
  end

  @doc """
  Delete a specific End User.

  Operation: `DeleteEndUser` | Tags: NumbersV2EndUser
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/RegulatoryCompliance/EndUsers/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
