# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.Dialingpermission.BulkcountryupdateService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a bulk update request to change voice dialing country permissions of one or more countries identified by the corresponding [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)

  Operation: `CreateDialingPermissionsCountryBulkUpdate` | Tags: VoiceV1BulkCountryUpdate

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UpdateRequest` | string | URL encoded JSON array of update objects. example : `[ { "iso_code": "GB", "low_risk_numbers_enabled": "true", "high_risk_special_numbers_enabled":"true", "high_risk_tollfraud_numbers_enabled": "false" } ]` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Dialingpermission.Bulkcountryupdate.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/DialingPermissions/BulkCountryUpdates",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Voice.V1.Dialingpermission.Bulkcountryupdate
       )}
    end
  end
end
