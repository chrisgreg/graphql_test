defmodule GqlChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GqlChatWeb.Telemetry,
      # Start the Ecto repository
      GqlChat.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GqlChat.PubSub},
      # Start Finch
      {Finch, name: GqlChat.Finch},
      # Start the Endpoint (http/https)
      GqlChatWeb.Endpoint,
      {Absinthe.Subscription, GqlChatWeb.Endpoint}
      # Start a worker by calling: GqlChat.Worker.start_link(arg)
      # {GqlChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GqlChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GqlChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
