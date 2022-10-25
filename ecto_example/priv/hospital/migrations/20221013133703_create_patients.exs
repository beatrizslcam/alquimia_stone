  defmodule EctoExample.Hospital.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table ("patients") do
      add(:first_name, :string)
      add(:lastst_name, :string)
      timestamps()
    end
  end
end



