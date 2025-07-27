import Config

# Development database configuration
config :pathvoid, Pathvoid.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pathvoid_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Development endpoint configuration with debugging enabled
config :pathvoid, PathvoidWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: String.to_integer(System.get_env("PORT") || "4000")],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "cERBLQelhBmvGI/dAOIPSgLBDht9DH5uTO3TgKgd8D6qq08qwxFYz+9MFTZpAeGf",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:pathvoid, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:pathvoid, ~w(--watch)]}
  ]

# Live reload configuration for development
config :pathvoid, PathvoidWeb.Endpoint,
  live_reload: [
    web_console_logger: true,
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/pathvoid_web/(?:controllers|live|components|router)/?.*\.(ex|heex)$"
    ]
  ]

# Enable development routes
config :pathvoid, dev_routes: true

# Development logging configuration
config :logger, :default_formatter, format: "[$level] $message\n"

# Development stacktrace configuration
config :phoenix, :stacktrace_depth, 20

# Runtime plug initialization for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Development LiveView configuration
config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

# Disable Swoosh API client for development
config :swoosh, :api_client, false
