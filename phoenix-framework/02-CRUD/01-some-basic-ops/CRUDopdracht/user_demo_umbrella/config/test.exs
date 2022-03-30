import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :user_demo, UserDemo.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "user_demo_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :user_demo_web, UserDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/pctp13FSpXcpyCQLFnVXPk0+4oQ087CM1DbodvGKA4F1N5QJeNfA6gAn7+FI3HS",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :user_demo, UserDemo.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
