import Config

# Application configuration
config :pathvoid,
  ecto_repos: [Pathvoid.Repo],
  generators: [timestamp_type: :utc_datetime]

# Web endpoint configuration
config :pathvoid, PathvoidWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: PathvoidWeb.ErrorHTML, json: PathvoidWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Pathvoid.PubSub,
  live_view: [signing_salt: "jw+NDidg"]

# Mailer configuration - uses local adapter for development
config :pathvoid, Pathvoid.Mailer, adapter: Swoosh.Adapters.Local

# JavaScript bundling configuration
config :esbuild,
  version: "0.17.11",
  pathvoid: [
    args:
      ~w(js/app.js js/theme_init.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# CSS bundling configuration
config :tailwind,
  version: "4.0.9",
  pathvoid: [
    args: ~w(
      --input=assets/css/app.css
      --output=priv/static/assets/css/app.css
    ),
    cd: Path.expand("..", __DIR__)
  ]

# Logger configuration
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# JSON library for Phoenix
config :phoenix, :json_library, Jason

# Import environment-specific configuration
import_config "#{config_env()}.exs"
