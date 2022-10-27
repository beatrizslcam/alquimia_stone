import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_alquimia, PhoenixAlquimiaWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MUoZBX5Xj3TeLOZa6VLXZSfJzvM0AmAjx58GzYRJDxSkgrlhNZtFBEOW7Pwc1kiW",
  server: false

# In test we don't send emails.
config :phoenix_alquimia, PhoenixAlquimia.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
