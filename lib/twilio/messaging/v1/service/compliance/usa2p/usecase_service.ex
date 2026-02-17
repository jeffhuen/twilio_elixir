# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.Service.Compliance.Usa2p.UsecaseService do
  @moduledoc """
  Messaging Service Use Case resource. Fetch possible use cases for service. The Use Cases API returns an empty list if there is an issue with the customer's A2P brand registration. This Brand cannot register any campaign use cases. Customers are requested to contact support with their A2P brand information.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchUsAppToPersonUsecase` | Tags: MessagingV1UsAppToPersonUsecase

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BrandRegistrationSid` | string | The unique string to identify the A2P brand. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{messaging_service_sid}/Compliance/Usa2p/Usecases",
           params: params,
           opts: opts,
           base_url: "https://messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "usecases")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p.Usecase
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, messaging_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, messaging_service_sid, Map.merge(params, page_opts), opts)
      end,
      "usecases"
    )
  end
end
