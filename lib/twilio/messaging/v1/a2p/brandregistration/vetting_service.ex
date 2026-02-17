# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.A2p.Brandregistration.VettingService do
  @moduledoc """
  A Messaging Service resource to add and get Brand Vettings.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListBrandVetting` | Tags: MessagingV1BrandVetting

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `VettingProvider` | string | The third-party provider of the vettings to read |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, brand_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/a2p/BrandRegistrations/#{brand_sid}/Vettings",
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
                 Twilio.Resources.Messaging.V1.A2p.Brandregistration.Vetting
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, brand_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, brand_sid, Map.merge(params, page_opts), opts)
      end,
      "data"
    )
  end

  @doc """


  Operation: `CreateBrandVetting` | Tags: MessagingV1BrandVetting

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `VettingProvider` | string |  Values: `campaign-verify`, `aegis` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `VettingId` | string | The unique ID of the vetting |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.A2p.Brandregistration.Vetting.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, brand_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/a2p/BrandRegistrations/#{brand_sid}/Vettings",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.A2p.Brandregistration.Vetting)}
    end
  end

  @doc """


  Operation: `FetchBrandVetting` | Tags: MessagingV1BrandVetting
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.A2p.Brandregistration.Vetting.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, brand_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/a2p/BrandRegistrations/#{brand_sid}/Vettings/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.A2p.Brandregistration.Vetting)}
    end
  end
end
