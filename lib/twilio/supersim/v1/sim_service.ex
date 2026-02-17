# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.SimService do
  @moduledoc """
  Individual IoT Super SIMs

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Super SIMs from your account.

  Operation: `ListSim` | Tags: SupersimV1Sim

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | The status of the Sim resources to read. Can be `new`, `ready`, `active`, `inactive`, or `scheduled`. |
  | `Fleet` | string | The SID or unique name of the Fleet to which a list of Sims are assigned. |
  | `Iccid` | string | The [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID) associated with a Super SIM to filter the list by. Passing this parameter will always return a list containing zero or one SIMs. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sims",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "sims")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Supersim.V1.Sim)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Super SIMs from your account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "sims"
    )
  end

  @doc """
  Register a Super SIM to your Account

  Operation: `CreateSim` | Tags: SupersimV1Sim

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Iccid` | string | The [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID) of the Super SIM to be added to your Account. |
  | `RegistrationCode` | string | The 10-digit code required to claim the Super SIM for your Account. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Sim.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sims",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Sim)}
    end
  end

  @doc """
  Fetch a Super SIM instance from your account.

  Operation: `FetchSim` | Tags: SupersimV1Sim
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Sim.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Sims/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Sim)}
    end
  end

  @doc """
  Updates the given properties of a Super SIM instance from your account.

  Operation: `UpdateSim` | Tags: SupersimV1Sim

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AccountSid` | string | The SID of the Account to which the Sim resource should belong. The Account SID can only be that of the requesting Account or that of a Subaccount of the requesting Account. Only valid when the Sim resource's status is new. |
  | `CallbackMethod` | string (http-method) | The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is POST. Values: `GET`, `POST` |
  | `CallbackUrl` | string (uri) | The URL we should call using the `callback_method` after an asynchronous update has finished. |
  | `Fleet` | string | The SID or unique name of the Fleet to which the SIM resource should be assigned. |
  | `Status` | string |  Values: `ready`, `active`, `inactive` |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Sim.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sims/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Sim)}
    end
  end
end
