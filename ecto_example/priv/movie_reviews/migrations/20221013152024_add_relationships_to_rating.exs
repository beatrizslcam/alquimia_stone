defmodule EctoExample.MovieReviews.Repo.Migrations.AddRelationshipsToRating do
  use Ecto.Migration

  def change do
    alter table("ratings") do
      add(:movie_id, references("movies"))
      add(:reviewer_id, references("reviewers"))
    end
  end
end