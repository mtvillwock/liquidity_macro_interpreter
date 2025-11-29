defmodule Liquidity.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiquidityWeb.Telemetry,
      {Phoenix.PubSub, name: Liquidity.PubSub},
      LiquidityWeb.Endpoint,
      {Quantum.Scheduler, jobs: []}
    ]

    opts = [strategy: :one_for_one, name: Liquidity.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    LiquidityWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
