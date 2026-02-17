# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Entity.FactorService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Factors for an Entity.

  Operation: `ListFactor` | Tags: VerifyV2Factor
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, identity, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Entities/#{identity}/Factors",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "factors")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Verify.V2.Service.Entity.Factor
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Factors for an Entity. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, identity, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, identity, Map.merge(params, page_opts), opts)
      end,
      "factors"
    )
  end

  @doc """
  Create a new Factor for the Entity

  Operation: `CreateNewFactor` | Tags: VerifyV2NewFactor

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FactorType` | string |  Values: `push`, `totp`, `passkeys` |
  | `FriendlyName` | string | The friendly name of this Factor. This can be any string up to 64 characters, meant for humans to distinguish between Factors. For `factor_type` `push`, this could be a device name. For `factor_type` `totp`, this value is used as the “account name” in constructing the `binding.uri` property. At the same time, we recommend avoiding providing PII. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Binding.Alg` | string | The algorithm used when `factor_type` is `push`. Algorithm supported: `ES256` |
  | `Binding.PublicKey` | string | The Ecdsa public key in PKIX, ASN.1 DER format encoded in Base64.  Required when `factor_type` is `push` |
  | `Binding.Secret` | string | The shared secret for TOTP factors encoded in Base32. This can be provided when creating the Factor, otherwise it will be generated.  Used when `factor_type` is `totp` |
  | `Config.Alg` | string |  Values: `sha1`, `sha256`, `sha512` |
  | `Config.AppId` | string | The ID that uniquely identifies your app in the Google or Apple store, such as `com.example.myapp`. It can be up to 100 characters long.  Required when `factor_type` is `push`. |
  | `Config.CodeLength` | integer | Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive. The default value is defined at the service level in the property `totp.code_length`. If not configured defaults to 6.  Used when `factor_type` is `totp` |
  | `Config.NotificationPlatform` | string |  Values: `apn`, `fcm`, `none` |
  | `Config.NotificationToken` | string | For APN, the device token. For FCM, the registration token. It is used to send the push notifications. Must be between 32 and 255 characters long.  Required when `factor_type` is `push`. |
  | `Config.SdkVersion` | string | The Verify Push SDK version used to configure the factor  Required when `factor_type` is `push` |
  | `Config.Skew` | integer | The number of time-steps, past and future, that are valid for validation of TOTP codes. Must be between 0 and 2, inclusive. The default value is defined at the service level in the property `totp.skew`. If not configured defaults to 1.  Used when `factor_type` is `totp` |
  | `Config.TimeStep` | integer | Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is generated every time_step seconds. Must be between 20 and 60 seconds, inclusive. The default value is defined at the service level in the property `totp.time_step`. Defaults to 30 seconds if not configured.  Used when `factor_type` is `totp` |
  | `Metadata` | string | Custom metadata associated with the factor. This is added by the Device/SDK directly to allow for the inclusion of device information. It must be a stringified JSON with only strings values eg. `{"os": "Android"}`. Can be up to 1024 characters in length. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Factor.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, identity, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Factors",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Entity.Factor)}
    end
  end

  @doc """
  Fetch a specific Factor.

  Operation: `FetchFactor` | Tags: VerifyV2Factor
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Factor.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, identity, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Factors/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Entity.Factor)}
    end
  end

  @doc """
  Update a specific Factor. This endpoint can be used to Verify a Factor if passed an `AuthPayload` param.

  Operation: `UpdateFactor` | Tags: VerifyV2Factor

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AuthPayload` | string | The optional payload needed to verify the Factor for the first time. E.g. for a TOTP, the numeric code. |
  | `Config.Alg` | string |  Values: `sha1`, `sha256`, `sha512` |
  | `Config.CodeLength` | integer | Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive |
  | `Config.NotificationPlatform` | string | The transport technology used to generate the Notification Token. Can be `apn`, `fcm` or `none`.  Required when `factor_type` is `push`. |
  | `Config.NotificationToken` | string | For APN, the device token. For FCM, the registration token. It is used to send the push notifications. Required when `factor_type` is `push`. If specified, this value must be between 32 and 255 characters long. |
  | `Config.SdkVersion` | string | The Verify Push SDK version used to configure the factor |
  | `Config.Skew` | integer | The number of time-steps, past and future, that are valid for validation of TOTP codes. Must be between 0 and 2, inclusive |
  | `Config.TimeStep` | integer | Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is generated every time_step seconds. Must be between 20 and 60 seconds, inclusive |
  | `FriendlyName` | string | The new friendly name of this Factor. It can be up to 64 characters. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Entity.Factor.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, identity, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Entities/#{identity}/Factors/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Entity.Factor)}
    end
  end

  @doc """
  Delete a specific Factor.

  Operation: `DeleteFactor` | Tags: VerifyV2Factor
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, identity, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Entities/#{identity}/Factors/#{sid}",
      opts: opts,
      base_url: "https://verify.twilio.com"
    )
  end
end
