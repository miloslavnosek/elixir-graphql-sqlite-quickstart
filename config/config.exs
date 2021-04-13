import Config

config :quickstart,
  ecto_repos: [Quickstart.Repo]

config :quickstart, Quickstart.Repo, database: "priv/db/database.db"
