# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.CompositionService do
  @moduledoc """
  Recording compositions

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List of all Recording compositions.

  Operation: `ListComposition` | Tags: VideoV1Composition

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | Read only Composition resources with this status. Can be: `enqueued`, `processing`, `completed`, `deleted`, or `failed`. |
  | `DateCreatedAfter` | string (date-time) | Read only Composition resources created on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time with time zone. |
  | `DateCreatedBefore` | string (date-time) | Read only Composition resources created before this ISO 8601 date-time with time zone. |
  | `RoomSid` | string | Read only Composition resources with this Room SID. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Compositions",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "compositions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Video.V1.Composition)
         }}

      error ->
        error
    end
  end

  @doc "Stream: List of all Recording compositions. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "compositions"
    )
  end

  @doc """


  Operation: `CreateComposition` | Tags: VideoV1Composition

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `RoomSid` | string | The SID of the Group Room with the media tracks to be used as composition sources. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AudioSources` | array | An array of track names from the same group room to merge into the new composition. Can include zero or more track names. The new composition includes all audio sources specified in `audio_sources` except for those specified in `audio_sources_excluded`. The track names in this parameter can include an asterisk as a wild card character, which will match zero or more characters in a track name. For example, `student*` includes `student` as well as `studentTeam`. Please, be aware that either video_layout or audio_sources have to be provided to get a valid creation request |
  | `AudioSourcesExcluded` | array | An array of track names to exclude. The new composition includes all audio sources specified in `audio_sources` except for those specified in `audio_sources_excluded`. The track names in this parameter can include an asterisk as a wild card character, which will match zero or more characters in a track name. For example, `student*` excludes `student` as well as `studentTeam`. This parameter can also be empty. |
  | `Format` | string |  Values: `mp4`, `webm` |
  | `Resolution` | string | A string that describes the columns (width) and rows (height) of the generated composed video in pixels. Defaults to `640x480`.  The string's format is `{width}x{height}` where:   * 16 <= `{width}` <= 1280 * 16 <= `{height}` <= 1280 * `{width}` * `{height}` <= 921,600  Typical values are:   * HD = `1280x720` * PAL = `1024x576` * VGA = `640x480` * CIF = `320x240`  Note that the `resolution` imposes an aspect ratio to the resulting composition. When the original video tracks are constrained by the aspect ratio, they are scaled to fit. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application on every composition event. If not provided, status callback events will not be dispatched. |
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `POST` or `GET` and the default is `POST`. Values: `GET`, `POST` |
  | `Trim` | boolean | Whether to clip the intervals where there is no active media in the composition. The default is `true`. Compositions with `trim` enabled are shorter when the Room is created and no Participant joins for a while as well as if all the Participants leave the room and join later, because those gaps will be removed. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  | `VideoLayout` | string | An object that describes the video layout of the composition in terms of regions. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. Please, be aware that either video_layout or audio_sources have to be provided to get a valid creation request |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Composition.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Compositions",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Composition)}
    end
  end

  @doc """
  Returns a single Composition resource identified by a Composition SID.

  Operation: `FetchComposition` | Tags: VideoV1Composition
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Composition.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Compositions/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Composition)}
    end
  end

  @doc """
  Delete a Recording Composition resource identified by a Composition SID.

  Operation: `DeleteComposition` | Tags: VideoV1Composition
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Compositions/#{sid}",
      opts: opts,
      base_url: "https://video.twilio.com"
    )
  end
end
