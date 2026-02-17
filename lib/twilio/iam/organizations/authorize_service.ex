# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Iam.Organizations.AuthorizeService do
  @moduledoc """
  Service for Authorize API operations.

  Operations: `list`
  """

  alias Twilio.Client

  @doc """
  List Authorize resources.

  Operation: `FetchAuthorize` | Tags: OauthV1Authorize

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `response_type` | string | Response Type |
  | `client_id` | string | The Client Identifier |
  | `redirect_uri` | string | The url to which response will be redirected to |
  | `scope` | string | The scope of the access request |
  | `state` | string | An opaque value which can be used to maintain state between the request and callback |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/authorize",
           params: params,
           opts: opts,
           base_url: "https://preview-iam.twilio.com"
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
