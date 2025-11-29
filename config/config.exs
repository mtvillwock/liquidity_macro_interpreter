import Config

config :liquidity, LiquidityWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: LiquidityWeb.ErrorHTML],
    layout: false
  ],
  pubsub_server: Liquidity.PubSub,
  live_view: [signing_salt: "your-secret-salt"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
