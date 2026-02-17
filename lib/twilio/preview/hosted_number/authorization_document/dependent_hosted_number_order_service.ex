# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.HostedNumber.AuthorizationDocument.DependentHostedNumberOrderService do
  @moduledoc """
  Service for DependentHostedNumberOrder API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of dependent HostedNumberOrders belonging to the AuthorizationDocument.

  Operation: `ListHostedNumbersDependentHostedNumberOrder` | Tags: PreviewHostedNumbersDependentHostedNumberOrder

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses. |
  | `PhoneNumber` | string (phone-number) | An E164 formatted phone number hosted by this HostedNumberOrder. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncomingPhoneNumberSid` | string | A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder. |
  | `FriendlyName` | string | A human readable description of this resource, up to 64 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, signing_document_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/HostedNumbers/AuthorizationDocuments/#{signing_document_sid}/DependentHostedNumberOrders",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Preview.HostedNumber.AuthorizationDocument.DependentHostedNumberOrder
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of dependent HostedNumberOrders belonging to the AuthorizationDocument. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, signing_document_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, signing_document_sid, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end
end
