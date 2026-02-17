defmodule Twilio do
  @moduledoc """
  Elixir SDK for the Twilio API.

  ## Quick Start

      # Configure in config/runtime.exs
      config :twilio_elixir,
        account_sid: System.fetch_env!("TWILIO_ACCOUNT_SID"),
        auth_token: System.fetch_env!("TWILIO_AUTH_TOKEN")

      # Create a client and make API calls
      client = Twilio.client()
      {:ok, message} = Twilio.Api.V2010.MessageService.create(client, %{
        "To" => "+15551234567",
        "From" => "+15559876543",
        "Body" => "Hello from Elixir!"
      })
  """

  @version Mix.Project.config()[:version]

  @doc "Returns the SDK version."
  @spec version() :: String.t()
  def version, do: @version

  @doc """
  Create a client from application config.

  Reads `:account_sid` and `:auth_token` from `:twilio_elixir` app env.
  """
  @spec client() :: Twilio.Client.t()
  def client, do: Twilio.Client.new()

  @doc """
  Create a client with explicit credentials.
  """
  @spec client(String.t(), String.t()) :: Twilio.Client.t()
  def client(account_sid, auth_token), do: Twilio.Client.new(account_sid, auth_token)

  @doc """
  Create a client with explicit credentials and options.

  ## Options

    * `:region` - Twilio region
    * `:edge` - Twilio edge location
    * `:max_retries` - Maximum retry attempts
    * `:account_sid` - Override account SID for subaccounts
  """
  @spec client(String.t(), String.t(), keyword()) :: Twilio.Client.t()
  def client(account_sid, auth_token, opts), do: Twilio.Client.new(account_sid, auth_token, opts)
end
