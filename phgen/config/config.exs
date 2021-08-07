# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phgen,
  ecto_repos: [Phgen.Repo]

# Configures the endpoint
config :phgen, PhgenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dt4Qw8cOq6K2AhE3uDN+p9H73Nb8VUhJHAjnYyA+uoLkdHQIzX2dFpExEw4anJi4",
  render_errors: [view: PhgenWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Phgen.PubSub,
  live_view: [signing_salt: "nctcnSlW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
