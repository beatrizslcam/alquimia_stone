defmodule EctoExample.MovieReviews.Schemas.Movie do
  use Ecto.Schema

  alias EctoExample.MovieReviews.Schemas.Rating

  schema "movies" do
    field(:title, :string)
    field(:director, :string)
    field(:year, :integer)

    has_many(:ratings, Rating)

    timestamps()
  end
end
