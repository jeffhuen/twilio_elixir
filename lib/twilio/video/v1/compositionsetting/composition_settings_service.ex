# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Compositionsetting.CompositionSettingsService do
  @moduledoc """
  Recording composition settings

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchCompositionSettings` | Tags: VideoV1CompositionSettings
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Compositionsetting.CompositionSettings.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/CompositionSettings/Default",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Video.V1.Compositionsetting.CompositionSettings
       )}
    end
  end

  @doc """


  Operation: `CreateCompositionSettings` | Tags: VideoV1CompositionSettings

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource and show to the user in the console |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AwsCredentialsSid` | string | The SID of the stored Credential resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AwsS3Url` | string (uri) | The URL of the AWS S3 bucket where the compositions should be stored. We only support DNS-compliant URLs like `https://documentation-example-twilio-bucket/compositions`, where `compositions` is the path in which you want the compositions to be stored. This URL accepts only URI-valid characters, as described in the [RFC 3986](https://tools.ietf.org/html/rfc3986#section-2). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AwsStorageEnabled` | boolean | Whether all compositions should be written to the `aws_s3_url`. When `false`, all compositions are stored in our cloud. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EncryptionEnabled` | boolean | Whether all compositions should be stored in an encrypted form. The default is `false`. |
  | `EncryptionKeySid` | string | The SID of the Public Key resource to use for encryption. |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Compositionsetting.CompositionSettings.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/CompositionSettings/Default",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Video.V1.Compositionsetting.CompositionSettings
       )}
    end
  end
end
