# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.EsimprofileService do
  @moduledoc """
  eSIM Profiles that can be loaded onto consumer eUICC SIMs

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of eSIM Profiles.

  Operation: `ListEsimProfile` | Tags: SupersimV1EsimProfile

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Eid` | string | List the eSIM Profiles that have been associated with an EId. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SimSid` | string | Find the eSIM Profile resource related to a [Sim](https://www.twilio.com/docs/iot/supersim/api/sim-resource) resource by providing the SIM SID. Will always return an array with either 1 or 0 records. |
  | `Status` | string | List the eSIM Profiles that are in a given status. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ESimProfiles",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "esim_profiles")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Supersim.V1.Esimprofile)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of eSIM Profiles. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "esim_profiles"
    )
  end

  @doc """
  Order an eSIM Profile.

  Operation: `CreateEsimProfile` | Tags: SupersimV1EsimProfile

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackMethod` | string (http-method) | The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is POST. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallbackUrl` | string | The URL we should call using the `callback_method` when the status of the eSIM Profile changes. At this stage of the eSIM Profile pilot, the a request to the URL will only be called when the ESimProfile resource changes from `reserving` to `available`. |
  | `Eid` | string | Identifier of the eUICC that will claim the eSIM Profile. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `GenerateMatchingId` | boolean | When set to `true`, a value for `Eid` does not need to be provided. Instead, when the eSIM profile is reserved, a matching ID will be generated and returned via the `matching_id` property. This identifies the specific eSIM profile that can be used by any capable device to claim and download the profile. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Esimprofile.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ESimProfiles",
             params: params,
             opts: opts,
             base_url: "https://supersim.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Esimprofile)}
    end
  end

  @doc """
  Fetch an eSIM Profile.

  Operation: `FetchEsimProfile` | Tags: SupersimV1EsimProfile
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Supersim.V1.Esimprofile.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/ESimProfiles/#{sid}",
             opts: opts,
             base_url: "https://supersim.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Supersim.V1.Esimprofile)}
    end
  end
end
