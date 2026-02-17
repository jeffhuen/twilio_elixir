# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.Porting.PortinService do
  @moduledoc """
  Service for Portin API operations.

  Operations: `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Allows to create a new port in request

  Operation: `CreatePortingPortIn` | Tags: NumbersV1PortingPortIn
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.Porting.Portin.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Porting/PortIn",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.Porting.Portin)}
    end
  end

  @doc """
  Fetch a port in request by SID

  Operation: `FetchPortingPortIn` | Tags: NumbersV1PortingPortIn
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.Porting.Portin.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Porting/PortIn/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.Porting.Portin)}
    end
  end

  @doc """
  Allows to cancel a port in request by SID

  Operation: `DeletePortingPortIn` | Tags: NumbersV1PortingPortIn
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Porting/PortIn/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
