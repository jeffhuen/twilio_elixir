# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.UserdefinedmessageService do
  @moduledoc """
  Allows your server-side application to send messages to the Voice SDK end user during an active Call.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new User Defined Message for the given Call SID.

  Operation: `CreateUserDefinedMessage` | Tags: Api20100401UserDefinedMessage

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Content` | string | The User Defined Message in the form of URL-encoded JSON string. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IdempotencyKey` | string | A unique string value to identify API call. This should be a unique string value per API call and can be a randomly generated. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Userdefinedmessage.t()}
          | {:error, Twilio.Error.t()}
  def create(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/UserDefinedMessages.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Userdefinedmessage)}
    end
  end
end
