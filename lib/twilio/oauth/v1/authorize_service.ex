# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Oauth.V1.AuthorizeService do
  @moduledoc """


  Operations: `list`
  """

  alias Twilio.Client

  @doc """
  Retrieves authorize uri

  Operation: `FetchAuthorize` | Tags: OauthV1Authorize

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ResponseType` | string | Response Type |
  | `ClientId` | string | The Client Identifier |
  | `RedirectUri` | string | The url to which response will be redirected to |
  | `Scope` | string | The scope of the access request |
  | `State` | string | An opaque value which can be used to maintain state between the request and callback |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/authorize",
           params: params,
           opts: opts,
           base_url: "https://oauth.twilio.com"
         ) do
      {:ok, data} -> {:ok, Twilio.Page.from_response(data, "authorize")}
      error -> error
    end
  end

  @doc "Stream: Retrieves authorize uri (lazy auto-pagination)."
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
