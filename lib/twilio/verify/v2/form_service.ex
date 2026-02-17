# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.FormService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch the forms for a specific Form Type.

  Operation: `FetchForm` | Tags: VerifyV2Form
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Form.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Forms/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Form)}
    end
  end
end
