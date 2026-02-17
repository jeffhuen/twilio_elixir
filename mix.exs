defmodule Twilio.MixProject do
  use Mix.Project

  @source_url "https://github.com/jeffhuen/twilio_elixir"
  @version "0.1.0"

  def project do
    [
      app: :twilio_elixir,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        flags: [:unmatched_returns, :error_handling, :extra_return, :missing_return]
      ],
      usage_rules: usage_rules()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto],
      mod: {Twilio.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # HTTP
      {:finch, "~> 0.19"},

      # Telemetry
      {:telemetry, "~> 1.0"},

      # Test stubs
      {:nimble_ownership, "~> 1.0"},

      # Dev/Test
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false},
      {:usage_rules, "~> 1.0", only: [:dev]},
      {:igniter, "~> 0.7", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      name: "twilio_elixir",
      description:
        "Complete Twilio SDK for Elixir with 1:1 parity to the official " <>
          "Ruby SDK. Full API coverage across 37 products (494 services, 467 resources). " <>
          "Auto-generated from official OpenAPI specs with full-fidelity mapping. " <>
          "Modern stack: Finch HTTP/2, automatic retries, webhooks, TwiML builder, " <>
          "telemetry, per-client config, streaming pagination.",
      maintainers: ["Jeff Huen"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md"
      },
      files: ~w(lib guides .formatter.exs mix.exs README.md LICENSE CHANGELOG.md OPENAPI_VERSION)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: [
        "README.md",
        "guides/getting-started.md",
        "guides/webhooks.md",
        "guides/twiml.md",
        "guides/testing.md",
        "guides/telemetry.md",
        "CHANGELOG.md"
      ],
      groups_for_extras: [
        Guides: [
          "guides/getting-started.md",
          "guides/webhooks.md",
          "guides/twiml.md",
          "guides/testing.md",
          "guides/telemetry.md"
        ]
      ],
      groups_for_modules: [
        "Client & Config": [Twilio, Twilio.Client, Twilio.Config],
        Errors: [Twilio.Error],
        Pagination: [Twilio.Page],
        Webhooks: [Twilio.Webhook],
        TwiML: [Twilio.TwiML, Twilio.TwiML.VoiceResponse, Twilio.TwiML.MessagingResponse],
        Testing: [Twilio.Test],
        Telemetry: [Twilio.Telemetry]
      ]
    ]
  end

  defp usage_rules do
    [
      file: "AGENTS.md",
      usage_rules: [{~r/.*/, link: :markdown}]
    ]
  end
end
