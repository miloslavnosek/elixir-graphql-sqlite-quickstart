defmodule Quickstart.Repo do
  use Ecto.Repo,
    otp_app: :quickstart,
    adapter: Ecto.Adapters.SQLite3
end
