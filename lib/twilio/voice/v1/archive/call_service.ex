# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.Archive.CallService do
  @moduledoc """


  Operations: `delete`
  """

  alias Twilio.Client

  @doc """
  Delete an archived call record from Bulk Export. Note: this does not also delete the record from the Voice API.

  Operation: `DeleteArchivedCall` | Tags: VoiceV1ArchivedCall
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, date, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Archives/#{date}/Calls/#{sid}",
      opts: opts,
      base_url: "https://voice.twilio.com"
    )
  end
end
