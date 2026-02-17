# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.StreamService do
  @moduledoc """
  The Stream resource allows you to create and stop uni-directional Media Streams

  Operations: `create`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a Stream

  Operation: `CreateStream` | Tags: Api20100401Stream

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Url` | string (uri) | Relative or absolute URL where WebSocket connection will be established. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Name` | string | The user-specified name of this Stream, if one was given when the Stream was created. This can be used to stop the Stream. |
  | `Parameter1.Name` | string | Parameter name |
  | `Parameter1.Value` | string | Parameter value |
  | `Parameter10.Name` | string | Parameter name |
  | `Parameter10.Value` | string | Parameter value |
  | `Parameter11.Name` | string | Parameter name |
  | `Parameter11.Value` | string | Parameter value |
  | `Parameter12.Name` | string | Parameter name |
  | `Parameter12.Value` | string | Parameter value |
  | `Parameter13.Name` | string | Parameter name |
  | `Parameter13.Value` | string | Parameter value |
  | `Parameter14.Name` | string | Parameter name |
  | `Parameter14.Value` | string | Parameter value |
  | `Parameter15.Name` | string | Parameter name |
  | `Parameter15.Value` | string | Parameter value |
  | `Parameter16.Name` | string | Parameter name |
  | `Parameter16.Value` | string | Parameter value |
  | `Parameter17.Name` | string | Parameter name |
  | `Parameter17.Value` | string | Parameter value |
  | `Parameter18.Name` | string | Parameter name |
  | `Parameter18.Value` | string | Parameter value |
  | `Parameter19.Name` | string | Parameter name |
  | `Parameter19.Value` | string | Parameter value |
  | `Parameter2.Name` | string | Parameter name |
  | `Parameter2.Value` | string | Parameter value |
  | `Parameter20.Name` | string | Parameter name |
  | `Parameter20.Value` | string | Parameter value |
  | `Parameter21.Name` | string | Parameter name |
  | `Parameter21.Value` | string | Parameter value |
  | `Parameter22.Name` | string | Parameter name |
  | `Parameter22.Value` | string | Parameter value |
  | `Parameter23.Name` | string | Parameter name |
  | `Parameter23.Value` | string | Parameter value |
  | `Parameter24.Name` | string | Parameter name |
  | `Parameter24.Value` | string | Parameter value |
  | `Parameter25.Name` | string | Parameter name |
  | `Parameter25.Value` | string | Parameter value |
  | `Parameter26.Name` | string | Parameter name |
  | `Parameter26.Value` | string | Parameter value |
  | `Parameter27.Name` | string | Parameter name |
  | `Parameter27.Value` | string | Parameter value |
  | `Parameter28.Name` | string | Parameter name |
  | `Parameter28.Value` | string | Parameter value |
  | `Parameter29.Name` | string | Parameter name |
  | `Parameter29.Value` | string | Parameter value |
  | `Parameter3.Name` | string | Parameter name |
  | `Parameter3.Value` | string | Parameter value |
  | `Parameter30.Name` | string | Parameter name |
  | `Parameter30.Value` | string | Parameter value |
  | `Parameter31.Name` | string | Parameter name |
  | `Parameter31.Value` | string | Parameter value |
  | `Parameter32.Name` | string | Parameter name |
  | `Parameter32.Value` | string | Parameter value |
  | `Parameter33.Name` | string | Parameter name |
  | `Parameter33.Value` | string | Parameter value |
  | `Parameter34.Name` | string | Parameter name |
  | `Parameter34.Value` | string | Parameter value |
  | `Parameter35.Name` | string | Parameter name |
  | `Parameter35.Value` | string | Parameter value |
  | `Parameter36.Name` | string | Parameter name |
  | `Parameter36.Value` | string | Parameter value |
  | `Parameter37.Name` | string | Parameter name |
  | `Parameter37.Value` | string | Parameter value |
  | `Parameter38.Name` | string | Parameter name |
  | `Parameter38.Value` | string | Parameter value |
  | `Parameter39.Name` | string | Parameter name |
  | `Parameter39.Value` | string | Parameter value |
  | `Parameter4.Name` | string | Parameter name |
  | `Parameter4.Value` | string | Parameter value |
  | `Parameter40.Name` | string | Parameter name |
  | `Parameter40.Value` | string | Parameter value |
  | `Parameter41.Name` | string | Parameter name |
  | `Parameter41.Value` | string | Parameter value |
  | `Parameter42.Name` | string | Parameter name |
  | `Parameter42.Value` | string | Parameter value |
  | `Parameter43.Name` | string | Parameter name |
  | `Parameter43.Value` | string | Parameter value |
  | `Parameter44.Name` | string | Parameter name |
  | `Parameter44.Value` | string | Parameter value |
  | `Parameter45.Name` | string | Parameter name |
  | `Parameter45.Value` | string | Parameter value |
  | `Parameter46.Name` | string | Parameter name |
  | `Parameter46.Value` | string | Parameter value |
  | `Parameter47.Name` | string | Parameter name |
  | `Parameter47.Value` | string | Parameter value |
  | `Parameter48.Name` | string | Parameter name |
  | `Parameter48.Value` | string | Parameter value |
  | `Parameter49.Name` | string | Parameter name |
  | `Parameter49.Value` | string | Parameter value |
  | `Parameter5.Name` | string | Parameter name |
  | `Parameter5.Value` | string | Parameter value |
  | `Parameter50.Name` | string | Parameter name |
  | `Parameter50.Value` | string | Parameter value |
  | `Parameter51.Name` | string | Parameter name |
  | `Parameter51.Value` | string | Parameter value |
  | `Parameter52.Name` | string | Parameter name |
  | `Parameter52.Value` | string | Parameter value |
  | `Parameter53.Name` | string | Parameter name |
  | `Parameter53.Value` | string | Parameter value |
  | `Parameter54.Name` | string | Parameter name |
  | `Parameter54.Value` | string | Parameter value |
  | `Parameter55.Name` | string | Parameter name |
  | `Parameter55.Value` | string | Parameter value |
  | `Parameter56.Name` | string | Parameter name |
  | `Parameter56.Value` | string | Parameter value |
  | `Parameter57.Name` | string | Parameter name |
  | `Parameter57.Value` | string | Parameter value |
  | `Parameter58.Name` | string | Parameter name |
  | `Parameter58.Value` | string | Parameter value |
  | `Parameter59.Name` | string | Parameter name |
  | `Parameter59.Value` | string | Parameter value |
  | `Parameter6.Name` | string | Parameter name |
  | `Parameter6.Value` | string | Parameter value |
  | `Parameter60.Name` | string | Parameter name |
  | `Parameter60.Value` | string | Parameter value |
  | `Parameter61.Name` | string | Parameter name |
  | `Parameter61.Value` | string | Parameter value |
  | `Parameter62.Name` | string | Parameter name |
  | `Parameter62.Value` | string | Parameter value |
  | `Parameter63.Name` | string | Parameter name |
  | `Parameter63.Value` | string | Parameter value |
  | `Parameter64.Name` | string | Parameter name |
  | `Parameter64.Value` | string | Parameter value |
  | `Parameter65.Name` | string | Parameter name |
  | `Parameter65.Value` | string | Parameter value |
  | `Parameter66.Name` | string | Parameter name |
  | `Parameter66.Value` | string | Parameter value |
  | `Parameter67.Name` | string | Parameter name |
  | `Parameter67.Value` | string | Parameter value |
  | `Parameter68.Name` | string | Parameter name |
  | `Parameter68.Value` | string | Parameter value |
  | `Parameter69.Name` | string | Parameter name |
  | `Parameter69.Value` | string | Parameter value |
  | `Parameter7.Name` | string | Parameter name |
  | `Parameter7.Value` | string | Parameter value |
  | `Parameter70.Name` | string | Parameter name |
  | `Parameter70.Value` | string | Parameter value |
  | `Parameter71.Name` | string | Parameter name |
  | `Parameter71.Value` | string | Parameter value |
  | `Parameter72.Name` | string | Parameter name |
  | `Parameter72.Value` | string | Parameter value |
  | `Parameter73.Name` | string | Parameter name |
  | `Parameter73.Value` | string | Parameter value |
  | `Parameter74.Name` | string | Parameter name |
  | `Parameter74.Value` | string | Parameter value |
  | `Parameter75.Name` | string | Parameter name |
  | `Parameter75.Value` | string | Parameter value |
  | `Parameter76.Name` | string | Parameter name |
  | `Parameter76.Value` | string | Parameter value |
  | `Parameter77.Name` | string | Parameter name |
  | `Parameter77.Value` | string | Parameter value |
  | `Parameter78.Name` | string | Parameter name |
  | `Parameter78.Value` | string | Parameter value |
  | `Parameter79.Name` | string | Parameter name |
  | `Parameter79.Value` | string | Parameter value |
  | `Parameter8.Name` | string | Parameter name |
  | `Parameter8.Value` | string | Parameter value |
  | `Parameter80.Name` | string | Parameter name |
  | `Parameter80.Value` | string | Parameter value |
  | `Parameter81.Name` | string | Parameter name |
  | `Parameter81.Value` | string | Parameter value |
  | `Parameter82.Name` | string | Parameter name |
  | `Parameter82.Value` | string | Parameter value |
  | `Parameter83.Name` | string | Parameter name |
  | `Parameter83.Value` | string | Parameter value |
  | `Parameter84.Name` | string | Parameter name |
  | `Parameter84.Value` | string | Parameter value |
  | `Parameter85.Name` | string | Parameter name |
  | `Parameter85.Value` | string | Parameter value |
  | `Parameter86.Name` | string | Parameter name |
  | `Parameter86.Value` | string | Parameter value |
  | `Parameter87.Name` | string | Parameter name |
  | `Parameter87.Value` | string | Parameter value |
  | `Parameter88.Name` | string | Parameter name |
  | `Parameter88.Value` | string | Parameter value |
  | `Parameter89.Name` | string | Parameter name |
  | `Parameter89.Value` | string | Parameter value |
  | `Parameter9.Name` | string | Parameter name |
  | `Parameter9.Value` | string | Parameter value |
  | `Parameter90.Name` | string | Parameter name |
  | `Parameter90.Value` | string | Parameter value |
  | `Parameter91.Name` | string | Parameter name |
  | `Parameter91.Value` | string | Parameter value |
  | `Parameter92.Name` | string | Parameter name |
  | `Parameter92.Value` | string | Parameter value |
  | `Parameter93.Name` | string | Parameter name |
  | `Parameter93.Value` | string | Parameter value |
  | `Parameter94.Name` | string | Parameter name |
  | `Parameter94.Value` | string | Parameter value |
  | `Parameter95.Name` | string | Parameter name |
  | `Parameter95.Value` | string | Parameter value |
  | `Parameter96.Name` | string | Parameter name |
  | `Parameter96.Value` | string | Parameter value |
  | `Parameter97.Name` | string | Parameter name |
  | `Parameter97.Value` | string | Parameter value |
  | `Parameter98.Name` | string | Parameter name |
  | `Parameter98.Value` | string | Parameter value |
  | `Parameter99.Name` | string | Parameter name |
  | `Parameter99.Value` | string | Parameter value |
  | `StatusCallback` | string (uri) | Absolute URL to which Twilio sends status callback HTTP requests. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method Twilio uses when sending `status_callback` requests. Possible values are `GET` and `POST`. Default is `POST`. Values: `GET`, `POST` |
  | `Track` | string |  Values: `inbound_track`, `outbound_track`, `both_tracks` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Stream.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Streams.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Stream)}
    end
  end

  @doc """
  Stop a Stream using either the SID of the Stream resource or the `name` used when creating the resource

  Operation: `UpdateStream` | Tags: Api20100401Stream

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `stopped` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Stream.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, call_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Streams/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Stream)}
    end
  end
end
