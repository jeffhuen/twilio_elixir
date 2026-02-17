# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.CompositionhookService do
  @moduledoc """
  Recording composition hooks

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List of all Recording CompositionHook resources.

  Operation: `ListCompositionHook` | Tags: VideoV1CompositionHook

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | Read only CompositionHook resources with an `enabled` value that matches this parameter. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedAfter` | string (date-time) | Read only CompositionHook resources created on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) datetime with time zone. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedBefore` | string (date-time) | Read only CompositionHook resources created before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) datetime with time zone. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | Read only CompositionHook resources with friendly names that match this string. The match is not case sensitive and can include asterisk `*` characters as wildcard match. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/CompositionHooks",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "composition_hooks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Compositionhook
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List of all Recording CompositionHook resources. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "composition_hooks"
    )
  end

  @doc """


  Operation: `CreateCompositionHook` | Tags: VideoV1CompositionHook

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to  100 characters long and it must be unique within the account. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AudioSources` | array | An array of track names from the same group room to merge into the compositions created by the composition hook. Can include zero or more track names. A composition triggered by the composition hook includes all audio sources specified in `audio_sources` except those specified in `audio_sources_excluded`. The track names in this parameter can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` includes tracks named `student` as well as `studentTeam`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AudioSourcesExcluded` | array | An array of track names to exclude. A composition triggered by the composition hook includes all audio sources specified in `audio_sources` except for those specified in `audio_sources_excluded`. The track names in this parameter can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` excludes `student` as well as `studentTeam`. This parameter can also be empty. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Enabled` | boolean | Whether the composition hook is active. When `true`, the composition hook will be triggered for every completed Group Room in the account. When `false`, the composition hook will never be triggered. |
  | `Format` | string |  Values: `mp4`, `webm` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Resolution` | string | A string that describes the columns (width) and rows (height) of the generated composed video in pixels. Defaults to `640x480`.  The string's format is `{width}x{height}` where:   * 16 <= `{width}` <= 1280 * 16 <= `{height}` <= 1280 * `{width}` * `{height}` <= 921,600  Typical values are:   * HD = `1280x720` * PAL = `1024x576` * VGA = `640x480` * CIF = `320x240`  Note that the `resolution` imposes an aspect ratio to the resulting composition. When the original video tracks are constrained by the aspect ratio, they are scaled to fit. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application on every composition event. If not provided, status callback events will not be dispatched. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `POST` or `GET` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Trim` | boolean | Whether to clip the intervals where there is no active media in the Compositions triggered by the composition hook. The default is `true`. Compositions with `trim` enabled are shorter when the Room is created and no Participant joins for a while as well as if all the Participants leave the room and join later, because those gaps will be removed. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VideoLayout` | string | An object that describes the video layout of the composition hook in terms of regions. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Compositionhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/CompositionHooks",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Compositionhook)}
    end
  end

  @doc """
  Returns a single CompositionHook resource identified by a CompositionHook SID.

  Operation: `FetchCompositionHook` | Tags: VideoV1CompositionHook
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Compositionhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/CompositionHooks/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Compositionhook)}
    end
  end

  @doc """


  Operation: `UpdateCompositionHook` | Tags: VideoV1CompositionHook

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to  100 characters long and it must be unique within the account. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AudioSources` | array | An array of track names from the same group room to merge into the compositions created by the composition hook. Can include zero or more track names. A composition triggered by the composition hook includes all audio sources specified in `audio_sources` except those specified in `audio_sources_excluded`. The track names in this parameter can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` includes tracks named `student` as well as `studentTeam`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AudioSourcesExcluded` | array | An array of track names to exclude. A composition triggered by the composition hook includes all audio sources specified in `audio_sources` except for those specified in `audio_sources_excluded`. The track names in this parameter can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` excludes `student` as well as `studentTeam`. This parameter can also be empty. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Enabled` | boolean | Whether the composition hook is active. When `true`, the composition hook will be triggered for every completed Group Room in the account. When `false`, the composition hook never triggers. |
  | `Format` | string |  Values: `mp4`, `webm` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Resolution` | string | A string that describes the columns (width) and rows (height) of the generated composed video in pixels. Defaults to `640x480`.  The string's format is `{width}x{height}` where:   * 16 <= `{width}` <= 1280 * 16 <= `{height}` <= 1280 * `{width}` * `{height}` <= 921,600  Typical values are:   * HD = `1280x720` * PAL = `1024x576` * VGA = `640x480` * CIF = `320x240`  Note that the `resolution` imposes an aspect ratio to the resulting composition. When the original video tracks are constrained by the aspect ratio, they are scaled to fit. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application on every composition event. If not provided, status callback events will not be dispatched. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `POST` or `GET` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Trim` | boolean | Whether to clip the intervals where there is no active media in the compositions triggered by the composition hook. The default is `true`. Compositions with `trim` enabled are shorter when the Room is created and no Participant joins for a while as well as if all the Participants leave the room and join later, because those gaps will be removed. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VideoLayout` | string | A JSON object that describes the video layout of the composition hook in terms of regions. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Compositionhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/CompositionHooks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Compositionhook)}
    end
  end

  @doc """
  Delete a Recording CompositionHook resource identified by a `CompositionHook SID`.

  Operation: `DeleteCompositionHook` | Tags: VideoV1CompositionHook
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/CompositionHooks/#{sid}",
      opts: opts,
      base_url: "https://video.twilio.com"
    )
  end
end
