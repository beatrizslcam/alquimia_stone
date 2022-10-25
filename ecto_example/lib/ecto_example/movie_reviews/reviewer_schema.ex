defmodule EctoExample.MovieReviews.Schemas.Reviewer do
  use Ecto.Schema

  alias EctoExample.MovieReviews.Schemas.Rating

  schema "reviewers" do
    field(:name, :string)

    has_many(:ratings, Rating)

    timestamps()
  end
end
