# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Recording.AddOnResult.PayloadService do
  @moduledoc """
  A single Add-on results' payload

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of payloads belonging to the AddOnResult

  Operation: `ListRecordingAddOnResultPayload` | Tags: Api20100401Payload
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, reference_sid, add_on_result_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
           "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults/#{add_on_result_sid}/Payloads.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "payloads")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Recording.AddOnResult.Payload
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of payloads belonging to the AddOnResult (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, reference_sid, add_on_result_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, reference_sid, add_on_result_sid, Map.merge(params, page_opts), opts)
      end,
      "payloads"
    )
  end

  @doc """
  Fetch an instance of a result payload

  Operation: `FetchRecordingAddOnResultPayload` | Tags: Api20100401Payload
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Recording.AddOnResult.Payload.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, reference_sid, add_on_result_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults/#{add_on_result_sid}/Payloads/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Recording.AddOnResult.Payload)}
    end
  end

  @doc """
  Delete a payload from the result along with all associated Data

  Operation: `DeleteRecordingAddOnResultPayload` | Tags: Api20100401Payload
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, reference_sid, add_on_result_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults/#{add_on_result_sid}/Payloads/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
