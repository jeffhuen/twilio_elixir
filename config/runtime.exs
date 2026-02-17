import Config

if config_env() == :prod do
  if sid = System.get_env("TWILIO_ACCOUNT_SID") do
    config :twilio_elixir, account_sid: sid
  end

  if token = System.get_env("TWILIO_AUTH_TOKEN") do
    config :twilio_elixir, auth_token: token
  end
end
