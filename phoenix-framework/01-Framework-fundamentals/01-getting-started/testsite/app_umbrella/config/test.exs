import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app_web, AppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "B/N6Lhzlj6V6mG98LQ1wxa8UVpECfVvsHEszzO4uxRPYhiG6o+Xs98jv8su01bSU",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
