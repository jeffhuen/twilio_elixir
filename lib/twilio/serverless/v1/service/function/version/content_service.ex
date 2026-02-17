# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.Function.Version.ContentService do
  @moduledoc """
  The code of a Function Version.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a the content of a specific Function Version resource.

  Operation: `FetchFunctionVersionContent` | Tags: ServerlessV1FunctionVersionContent
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Function.Version.Content.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, function_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Functions/#{function_sid}/Versions/#{sid}/Content",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Serverless.V1.Service.Function.Version.Content
       )}
    end
  end
end
