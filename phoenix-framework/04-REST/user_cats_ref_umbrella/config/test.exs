import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :user_cats_ref, UserCatsRef.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "user_cats_ref_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :user_cats_ref_web, UserCatsRefWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "oCjnrsGgJcx3VteP2eLlWVsnki9lsQ4/uLXVToC20T4lL4BrTjjhXd5Eb9e5qNf+",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :user_cats_ref, UserCatsRef.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
