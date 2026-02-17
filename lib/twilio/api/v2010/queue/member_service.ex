# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Queue.MemberService do
  @moduledoc """
  Calls in a call queue

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve the members of the queue

  Operation: `ListMember` | Tags: Api20100401Member
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, queue_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Queues/#{queue_sid}/Members.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "queue_members")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Queue.Member)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve the members of the queue (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, queue_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, queue_sid, Map.merge(params, page_opts), opts)
      end,
      "queue_members"
    )
  end

  @doc """
  Fetch a specific member from the queue

  Operation: `FetchMember` | Tags: Api20100401Member
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Queue.Member.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, queue_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Queues/#{queue_sid}/Members/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Queue.Member)}
    end
  end

  @doc """
  Dequeue a member from a queue and have the member's call begin executing the TwiML document at that URL

  Operation: `UpdateMember` | Tags: Api20100401Member

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Url` | string (uri) | The absolute URL of the Queue resource. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Method` | string (http-method) | How to pass the update request data. Can be `GET` or `POST` and the default is `POST`. `POST` sends the data as encoded form data and `GET` sends the data as query parameters. Values: `GET`, `POST` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Queue.Member.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, queue_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Queues/#{queue_sid}/Members/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Queue.Member)}
    end
  end
end
