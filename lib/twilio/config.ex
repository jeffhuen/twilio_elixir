defmodule Twilio.Config do
  @moduledoc """
  Configuration management for the Twilio SDK.

  Reads from application environment and supports per-client overrides.
  """

  @app :twilio_elixir

  @doc "Get the configured account SID."
  @spec account_sid() :: String.t() | nil
  def account_sid, do: get(:account_sid)

  @doc "Get the configured auth token."
  @spec auth_token() :: String.t() | nil
  def auth_token, do: get(:auth_token)

  @doc "Get the configured region."
  @spec region() :: String.t() | nil
  def region, do: get(:region)

  @doc "Get the configured edge."
  @spec edge() :: String.t() | nil
  def edge, do: get(:edge)

  @doc "Get the configured max retries (default: 0)."
  @spec max_retries() :: non_neg_integer()
  def max_retries, do: get(:max_retries) || 0

  @doc "Get a config value."
  @spec get(atom()) :: term()
  def get(key) do
    Application.get_env(@app, key)
  end
end
