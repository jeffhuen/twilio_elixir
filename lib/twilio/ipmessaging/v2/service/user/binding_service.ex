# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V2.Service.User.BindingService do
  @moduledoc """


  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUserBinding` | Tags: IpMessagingV2UserBinding

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BindingType` | array |  |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, user_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Users/#{user_sid}/Bindings",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "bindings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V2.Service.User.Binding
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, user_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, user_sid, Map.merge(params, page_opts), opts)
      end,
      "bindings"
    )
  end

  @doc """


  Operation: `FetchUserBinding` | Tags: IpMessagingV2UserBinding
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.User.Binding.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, user_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Users/#{user_sid}/Bindings/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.User.Binding)}
    end
  end

  @doc """


  Operation: `DeleteUserBinding` | Tags: IpMessagingV2UserBinding
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, user_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Users/#{user_sid}/Bindings/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
