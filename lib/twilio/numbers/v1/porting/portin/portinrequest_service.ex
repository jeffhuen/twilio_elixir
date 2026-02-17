# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.Porting.Portin.PortinrequestService do
  @moduledoc """


  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all PortInRequests for a user

  Operation: `ListPortInRequests` | Tags: NumbersV1PortingPortIn

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Token` | string | Page start token, if null then it will start from the beginning |
  | `Size` | integer (int32) | Number of items per page |
  | `PortInRequestSid` | string | Filter by Port in request SID, supports multiple values separated by comma |
  | `PortInRequestStatus` | string | Filter by Port In request status |
  | `CreatedBefore` | string | Find all created before a certain date |
  | `CreatedAfter` | string | Find all created after a certain date |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Porting/PortIn/PortInRequests",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "port_in_requests")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V1.Porting.Portin.Portinrequest
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all PortInRequests for a user (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "port_in_requests"
    )
  end
end
