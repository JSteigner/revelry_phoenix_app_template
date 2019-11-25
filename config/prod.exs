use Mix.Config
# NOTE: Compile-time production configuration goes here

config :mapp_construction, MappConstructionWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  root: ".",
  version: Application.spec(:mapp_construction, :vsn)

config :mapp_construction, MappConstruction.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true,
  types: MappConstruction.PostgresTypes

# Do not print debug messages in production
config :logger, level: :info

config :rollbax, enable_crash_reports: true

config :mapp_construction, MappConstruction.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: System.get_env("SENDGRID_API_KEY")
