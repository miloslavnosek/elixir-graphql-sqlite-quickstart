defmodule Quickstart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Quickstart.Worker.start_link(arg)
      # {Quickstart.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: QuickstartWeb.Router, options: [port: 8080]},
      Quickstart.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Quickstart.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
