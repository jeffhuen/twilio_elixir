# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Recording.AddonresultService do
  @moduledoc """
  The results of an Add-on API call

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of results belonging to the recording

  Operation: `ListRecordingAddOnResult` | Tags: Api20100401AddOnResult
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, reference_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "add_on_results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Recording.Addonresult
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of results belonging to the recording (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, reference_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, reference_sid, Map.merge(params, page_opts), opts)
      end,
      "add_on_results"
    )
  end

  @doc """
  Fetch an instance of an AddOnResult

  Operation: `FetchRecordingAddOnResult` | Tags: Api20100401AddOnResult
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Recording.Addonresult.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, reference_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Recording.Addonresult)}
    end
  end

  @doc """
  Delete a result and purge all associated Payloads

  Operation: `DeleteRecordingAddOnResult` | Tags: Api20100401AddOnResult
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, reference_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Recordings/#{reference_sid}/AddOnResults/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
