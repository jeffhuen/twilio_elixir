# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.SchemaService do
  @moduledoc """
  Versioned Schema definitions for Event Types

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a specific schema with its nested versions.

  Operation: `FetchSchema` | Tags: EventsV1Schema
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Schema.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Schemas/#{sid}",
             opts: opts,
             base_url: "https://events.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Schema)}
    end
  end
end
