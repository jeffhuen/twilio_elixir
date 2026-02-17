# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.A2p.BrandRegistrationService do
  @moduledoc """
  A Messaging Service resource to add and fetch Brand Registrations.

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListBrandRegistrations` | Tags: MessagingV1BrandRegistration
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/a2p/BrandRegistrations",
           params: params,
           opts: opts,
           base_url: "https://messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "data")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Messaging.V1.A2p.BrandRegistration
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
      "data"
    )
  end

  @doc """


  Operation: `CreateBrandRegistrations` | Tags: MessagingV1BrandRegistration

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `A2PProfileBundleSid` | string | A2P Messaging Profile Bundle Sid. |
  | `CustomerProfileBundleSid` | string | Customer Profile Bundle Sid. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BrandType` | string | Type of brand being created. One of: "STANDARD", "SOLE_PROPRIETOR". SOLE_PROPRIETOR is for low volume, SOLE_PROPRIETOR use cases. STANDARD is for all other use cases. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Mock` | boolean | A boolean that specifies whether brand should be a mock or not. If true, brand will be registered as a mock brand. Defaults to false if no value is provided. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SkipAutomaticSecVet` | boolean | A flag to disable automatic secondary vetting for brands which it would otherwise be done. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.A2p.BrandRegistration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/a2p/BrandRegistrations",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.A2p.BrandRegistration)}
    end
  end

  @doc """


  Operation: `FetchBrandRegistrations` | Tags: MessagingV1BrandRegistration
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.A2p.BrandRegistration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/a2p/BrandRegistrations/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.A2p.BrandRegistration)}
    end
  end

  @doc """


  Operation: `UpdateBrandRegistrations` | Tags: MessagingV1BrandRegistration
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.A2p.BrandRegistration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/a2p/BrandRegistrations/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.A2p.BrandRegistration)}
    end
  end
end
