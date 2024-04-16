defmodule Foodtruckmatch.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :name, :string
      add :address, :string
      add :latitude, :float
      add :longitude, :float
      add :items, :text

      timestamps(type: :utc_datetime)
    end
  end
end
