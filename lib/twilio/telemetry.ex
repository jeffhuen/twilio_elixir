defmodule Twilio.Telemetry do
  @moduledoc """
  Telemetry event definitions for the Twilio SDK.

  ## Events

    * `[:twilio, :request, :start]` — Emitted before a request is made.

      Measurements: `%{system_time: integer()}`

      Metadata: `%{method: atom(), path: String.t(), product: String.t()}`

    * `[:twilio, :request, :stop]` — Emitted after a request completes (success or failure).

      Measurements: `%{duration: integer()}`

      Metadata: `%{method: atom(), path: String.t(), product: String.t(),
      status: integer() | nil, retries: integer(),
      request_id: String.t() | nil, error: Twilio.Error.t() | nil}`

    * `[:twilio, :request, :exception]` — Emitted when a request raises.

      Measurements: `%{duration: integer()}`

      Metadata: `%{method: atom(), path: String.t(), product: String.t(),
      kind: atom(), reason: term()}`

    * `[:twilio, :request, :retry]` — Emitted when a request is retried.

      Measurements: `%{attempt: integer(), wait_ms: integer()}`

      Metadata: `%{method: atom(), path: String.t(), product: String.t(),
      status: integer() | nil, reason: atom()}`
  """

  @doc false
  def start(meta) do
    start_time = System.monotonic_time()

    :telemetry.execute(
      [:twilio, :request, :start],
      %{system_time: System.system_time()},
      meta
    )

    start_time
  end

  @doc false
  def stop(start_time, meta) do
    duration = System.monotonic_time() - start_time

    :telemetry.execute(
      [:twilio, :request, :stop],
      %{duration: duration},
      meta
    )
  end

  @doc false
  def exception(start_time, meta) do
    duration = System.monotonic_time() - start_time

    :telemetry.execute(
      [:twilio, :request, :exception],
      %{duration: duration},
      meta
    )
  end

  @doc false
  def retry(meta) do
    :telemetry.execute(
      [:twilio, :request, :retry],
      %{attempt: meta.attempt, wait_ms: meta.wait_ms},
      meta
    )
  end

  @doc false
  def product_from_base_url("https://api.twilio.com"), do: "api"

  def product_from_base_url("https://" <> rest) do
    case String.split(rest, ".", parts: 2) do
      [product, _] -> product
      _ -> "api"
    end
  end

  def product_from_base_url(_), do: "api"
end
