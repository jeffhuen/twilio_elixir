# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.HostedNumber.AuthorizationDocumentService do
  @moduledoc """
  Service for AuthorizationDocument API operations.

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of AuthorizationDocuments belonging to the account initiating the request.

  Operation: `ListHostedNumbersAuthorizationDocument` | Tags: PreviewHostedNumbersAuthorizationDocument

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | Email that this AuthorizationDocument will be sent to for signing. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/HostedNumbers/AuthorizationDocuments",
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
                 Twilio.Resources.Preview.HostedNumber.AuthorizationDocument
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of AuthorizationDocuments belonging to the account initiating the request. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  Create an AuthorizationDocument for authorizing the hosting of phone number capabilities on Twilio's platform.

  Operation: `CreateHostedNumbersAuthorizationDocument` | Tags: PreviewHostedNumbersAuthorizationDocument

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressSid` | string | A 34 character string that uniquely identifies the Address resource that is associated with this AuthorizationDocument. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContactPhoneNumber` | string | The contact phone number of the person authorized to sign the Authorization Document. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContactTitle` | string | The title of the person authorized to sign the Authorization Document for this phone number. |
  | `Email` | string | Email that this AuthorizationDocument will be sent to for signing. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HostedNumberOrderSids` | array | A list of HostedNumberOrder sids that this AuthorizationDocument will authorize for hosting phone number capabilities on Twilio's platform. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CcEmails` | array | Email recipients who will be informed when an Authorization Document has been sent and signed. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.HostedNumber.AuthorizationDocument.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/HostedNumbers/AuthorizationDocuments",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Preview.HostedNumber.AuthorizationDocument)}
    end
  end

  @doc """
  Fetch a specific AuthorizationDocument.

  Operation: `FetchHostedNumbersAuthorizationDocument` | Tags: PreviewHostedNumbersAuthorizationDocument
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.HostedNumber.AuthorizationDocument.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/HostedNumbers/AuthorizationDocuments/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Preview.HostedNumber.AuthorizationDocument)}
    end
  end

  @doc """
  Updates a specific AuthorizationDocument.

  Operation: `UpdateHostedNumbersAuthorizationDocument` | Tags: PreviewHostedNumbersAuthorizationDocument

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AddressSid` | string | A 34 character string that uniquely identifies the Address resource that is associated with this AuthorizationDocument. |
  | `CcEmails` | array | Email recipients who will be informed when an Authorization Document has been sent and signed |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContactPhoneNumber` | string | The contact phone number of the person authorized to sign the Authorization Document. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ContactTitle` | string | The title of the person authorized to sign the Authorization Document for this phone number. |
  | `Email` | string | Email that this AuthorizationDocument will be sent to for signing. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HostedNumberOrderSids` | array | A list of HostedNumberOrder sids that this AuthorizationDocument will authorize for hosting phone number capabilities on Twilio's platform. |
  | `Status` | string |  Values: `opened`, `signing`, `signed`, `canceled`, `failed` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.HostedNumber.AuthorizationDocument.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/HostedNumbers/AuthorizationDocuments/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Preview.HostedNumber.AuthorizationDocument)}
    end
  end
end
