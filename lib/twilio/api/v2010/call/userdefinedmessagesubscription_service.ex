# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.UserdefinedmessagesubscriptionService do
  @moduledoc """
  Subscription for server-side application access to messages sent from the Voice SDK for an active Call.

  Operations: `create`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Subscribe to User Defined Messages for a given Call SID.

  Operation: `CreateUserDefinedMessageSubscription` | Tags: Api20100401UserDefinedMessageSubscription

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Callback` | string (uri) | The URL we should call using the `method` to send user defined events to your application. URLs must contain a valid hostname (underscores are not permitted). |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IdempotencyKey` | string | A unique string value to identify API call. This should be a unique string value per API call and can be a randomly generated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Method` | string (http-method) | The HTTP method Twilio will use when requesting the above `Url`. Either `GET` or `POST`. Default is `POST`. Values: `GET`, `POST` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Userdefinedmessagesubscription.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/UserDefinedMessageSubscriptions.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Api.V2010.Call.Userdefinedmessagesubscription
       )}
    end
  end

  @doc """
  Delete a specific User Defined Message Subscription.

  Operation: `DeleteUserDefinedMessageSubscription` | Tags: Api20100401UserDefinedMessageSubscription
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, call_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/UserDefinedMessageSubscriptions/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
