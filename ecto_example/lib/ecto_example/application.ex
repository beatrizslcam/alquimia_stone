defmodule EctoExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EctoExample.MovieReviews.Repo,
      EctoExample.Hospital.Repo,
      EctoExample.University.Repo,
      EctoExample.DriverLicenses.Repo

      # Starts a worker by calling: EctoExample.Worker.start_link(arg)
      # {EctoExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
