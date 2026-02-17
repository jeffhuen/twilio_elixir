# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.Service.User.BindingService do
  @moduledoc """
  List of bindings for a given user

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUserBinding` | Tags: ChatV2UserBinding

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BindingType` | array | The push technology used by the User Binding resources to read. Can be: `apn`, `gcm`, or `fcm`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, user_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Users/#{user_sid}/Bindings",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "bindings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Chat.V2.Service.User.Binding
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


  Operation: `FetchUserBinding` | Tags: ChatV2UserBinding
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.User.Binding.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, user_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Users/#{user_sid}/Bindings/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.User.Binding)}
    end
  end

  @doc """


  Operation: `DeleteUserBinding` | Tags: ChatV2UserBinding
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, user_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Users/#{user_sid}/Bindings/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
