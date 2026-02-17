# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Recordingsetting.RecordingSettingsService do
  @moduledoc """
  Recording settings

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchRecordingSettings` | Tags: VideoV1RecordingSettings
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Recordingsetting.RecordingSettings.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/RecordingSettings/Default",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Video.V1.Recordingsetting.RecordingSettings
       )}
    end
  end

  @doc """


  Operation: `CreateRecordingSettings` | Tags: VideoV1RecordingSettings

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource and be shown to users in the console |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AwsCredentialsSid` | string | The SID of the stored Credential resource. |
  | `AwsS3Url` | string (uri) | The URL of the AWS S3 bucket where the recordings should be stored. We only support DNS-compliant URLs like `https://documentation-example-twilio-bucket/recordings`, where `recordings` is the path in which you want the recordings to be stored. This URL accepts only URI-valid characters, as described in the [RFC 3986](https://tools.ietf.org/html/rfc3986#section-2). |
  | `AwsStorageEnabled` | boolean | Whether all recordings should be written to the `aws_s3_url`. When `false`, all recordings are stored in our cloud. |
  | `EncryptionEnabled` | boolean | Whether all recordings should be stored in an encrypted form. The default is `false`. |
  | `EncryptionKeySid` | string | The SID of the Public Key resource to use for encryption. |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Recordingsetting.RecordingSettings.t()}
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/RecordingSettings/Default",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Video.V1.Recordingsetting.RecordingSettings
       )}
    end
  end
end
