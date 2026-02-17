import Config

config :twilio_elixir,
  account_sid: "ACtest123456789012345678901234",
  auth_token: "test_auth_token_for_testing_only"

if File.exists?(Path.expand("../dev/secrets.exs", __DIR__)) do
  import_config "../dev/secrets.exs"
end
