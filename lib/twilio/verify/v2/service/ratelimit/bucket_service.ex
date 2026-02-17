# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.Ratelimit.BucketService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Buckets for a Rate Limit.

  Operation: `ListBucket` | Tags: VerifyV2Bucket
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, rate_limit_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/Services/#{service_sid}/RateLimits/#{rate_limit_sid}/Buckets",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "buckets")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Buckets for a Rate Limit. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, rate_limit_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, rate_limit_sid, Map.merge(params, page_opts), opts)
      end,
      "buckets"
    )
  end

  @doc """
  Create a new Bucket for a Rate Limit

  Operation: `CreateBucket` | Tags: VerifyV2Bucket

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Interval` | integer | Number of seconds that the rate limit will be enforced over. |
  | `Max` | integer | Maximum number of requests permitted in during the interval. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, rate_limit_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/RateLimits/#{rate_limit_sid}/Buckets",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket)}
    end
  end

  @doc """
  Fetch a specific Bucket.

  Operation: `FetchBucket` | Tags: VerifyV2Bucket
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, rate_limit_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/RateLimits/#{rate_limit_sid}/Buckets/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket)}
    end
  end

  @doc """
  Update a specific Bucket.

  Operation: `UpdateBucket` | Tags: VerifyV2Bucket

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Interval` | integer | Number of seconds that the rate limit will be enforced over. |
  | `Max` | integer | Maximum number of requests permitted in during the interval. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, rate_limit_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/RateLimits/#{rate_limit_sid}/Buckets/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Ratelimit.Bucket)}
    end
  end

  @doc """
  Delete a specific Bucket.

  Operation: `DeleteBucket` | Tags: VerifyV2Bucket
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, rate_limit_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/RateLimits/#{rate_limit_sid}/Buckets/#{sid}",
      opts: opts,
      base_url: "https://verify.twilio.com"
    )
  end
end
