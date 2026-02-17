# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Oauth.V2.AuthorizeService do
  @moduledoc """
  Service for Authorize API operations.

  Operations: `list`
  """

  alias Twilio.Client

  @doc """
  List Authorize resources.

  Operation: `FetchOauth2Authorize` | Tags: OauthV2Authorize

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `response_type` | string |  |
  | `client_id` | string |  |
  | `redirect_uri` | string |  |
  | `scope` | string |  |
  | `state` | string |  |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/authorize",
           params: params,
           opts: opts,
           base_url: "https://oauth.twilio.com"
         ) do
      {:ok, data} -> {:ok, Twilio.Page.from_response(data, "authorize")}
      error -> error
    end
  end

  @doc "Stream all resources with lazy auto-pagination."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "authorize"
    )
  end
end
