defmodule Twilio.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    pool_size = max(System.schedulers_online(), 10)

    children = [
      {Finch, name: Twilio.Finch, pools: %{default: [size: pool_size, count: 1]}}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Twilio.Supervisor)
  end
end
