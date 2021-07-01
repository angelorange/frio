# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :frio,
  ecto_repos: [Frio.Repo]

# Configures the endpoint
config :frio, FrioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "84xDoE2S+PHhMFT77OxgrvtMdxYuPzf06RrZKQQOdLBh+gtDE7lsspexVptvoB6+",
  render_errors: [view: FrioWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Frio.PubSub,
  live_view: [signing_salt: "QMb+7vpl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
