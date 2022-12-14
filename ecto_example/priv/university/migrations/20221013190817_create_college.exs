defmodule EctoExample.University.Repo.Migrations.CreateCollege do
  use Ecto.Migration

  def change do
    create table "colleges" do
      add(:college_name, :string)
      add(:state, :string)
      add(:price, :decimal)

      timestamps()
    end

  end
end
