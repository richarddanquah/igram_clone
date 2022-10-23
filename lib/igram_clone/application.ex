defmodule IgramClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      IgramClone.Repo,
      # Start the Telemetry supervisor
      IgramCloneWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: IgramClone.PubSub},
      # Start the Endpoint (http/https)
      IgramCloneWeb.Endpoint
      # Start a worker by calling: IgramClone.Worker.start_link(arg)
      # {IgramClone.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IgramClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IgramCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
