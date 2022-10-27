import Config



config :ecto_example, EctoExample.Hospital.Repo,
  database: System.get_env("DATABASE_NAME", "hospital_database"),
  username: System.get_env("DATABASE_USERNAME", "postgres"),
  password: System.get_env("DATABASE_PASSWORD", "postgres"),
  hostname: System.get_env("DATABASE_HOST", "localhost"),
  priv: "priv/hospital"

config :ecto_example, EctoExample.DriverLicenses.Repo,
  database: System.get_env("DATABASE_NAME", "driver_licenses_database"),
  username: System.get_env("DATABASE_USERNAME", "postgres"),
  password: System.get_env("DATABASE_PASSWORD", "postgres"),
  hostname: System.get_env("DATABASE_HOST", "localhost"),
  priv: "priv/driver_licenses"

config :ecto_example, EctoExample.University.Repo,
  database: System.get_env("DATABASE_NAME", "university_database"),
  username: System.get_env("DATABASE_USERNAME", "postgres"),
  password: System.get_env("DATABASE_PASSWORD", "postgres"),
  hostname: System.get_env("DATABASE_HOST", "localhost"),
  priv: "priv/university"

config :ecto_example, EctoExample.MovieReviews.Repo,
  database: System.get_env("DATABASE_NAME", "movie_reviews_database"),
  username: System.get_env("DATABASE_USERNAME", "postgres"),
  password: System.get_env("DATABASE_PASSWORD", "postgres"),
  hostname: System.get_env("DATABASE_HOST", "localhost"),
  priv: "priv/movie_reviews"

config :ecto_example,
  ecto_repos: [
    EctoExample.Hospital.Repo,
    EctoExample.DriverLicenses.Repo,
    EctoExample.University.Repo,
    EctoExample.MovieReviews.Repo
  ]
