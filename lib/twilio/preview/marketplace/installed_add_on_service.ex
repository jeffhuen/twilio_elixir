# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Marketplace.InstalledAddOnService do
  @moduledoc """
  Service for InstalledAddOn API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Add-ons currently installed on this Account.

  Operation: `ListMarketplaceInstalledAddOn` | Tags: PreviewMarketplaceInstalledAddOn
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/marketplace/InstalledAddOns",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "installed_add_ons")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Preview.Marketplace.InstalledAddOn
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Add-ons currently installed on this Account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "installed_add_ons"
    )
  end

  @doc """
  Install an Add-on for the Account specified.

  Operation: `CreateMarketplaceInstalledAddOn` | Tags: PreviewMarketplaceInstalledAddOn

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AcceptTermsOfService` | boolean | Whether the Terms of Service were accepted. |
  | `AvailableAddOnSid` | string | The SID of the AvaliableAddOn to install. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Configuration` | string | The JSON object that represents the configuration of the new Add-on being installed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. This value must be unique within the Account. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Marketplace.InstalledAddOn.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/marketplace/InstalledAddOns",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Marketplace.InstalledAddOn)}
    end
  end

  @doc """
  Fetch an instance of an Add-on currently installed on this Account.

  Operation: `FetchMarketplaceInstalledAddOn` | Tags: PreviewMarketplaceInstalledAddOn
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Marketplace.InstalledAddOn.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/marketplace/InstalledAddOns/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Marketplace.InstalledAddOn)}
    end
  end

  @doc """
  Update an Add-on installation for the Account specified.

  Operation: `UpdateMarketplaceInstalledAddOn` | Tags: PreviewMarketplaceInstalledAddOn

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Configuration` | string | Valid JSON object that conform to the configuration schema exposed by the associated AvailableAddOn resource. This is only required by Add-ons that need to be configured |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. This value must be unique within the Account. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Marketplace.InstalledAddOn.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/marketplace/InstalledAddOns/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Marketplace.InstalledAddOn)}
    end
  end

  @doc """
  Remove an Add-on installation from your account

  Operation: `DeleteMarketplaceInstalledAddOn` | Tags: PreviewMarketplaceInstalledAddOn
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/marketplace/InstalledAddOns/#{sid}",
      opts: opts,
      base_url: "https://preview.twilio.com"
    )
  end
end
