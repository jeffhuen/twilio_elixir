import Config

if File.exists?(Path.expand("../dev/secrets.exs", __DIR__)) do
  import_config "../dev/secrets.exs"
end
