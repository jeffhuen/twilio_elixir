# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.TemplateService do
  @moduledoc """


  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List all the available templates for a given Account.

  Operation: `ListVerificationTemplate` | Tags: VerifyV2Template

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | String filter used to query templates with a given friendly name. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Templates",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "templates")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Verify.V2.Template)
         }}

      error ->
        error
    end
  end

  @doc "Stream: List all the available templates for a given Account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "templates"
    )
  end
end
