defmodule EctoExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_example,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EctoExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">=0.0.0"},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:tesla, "~> 1.4"}
      {:hackney, "~> 1.17"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
