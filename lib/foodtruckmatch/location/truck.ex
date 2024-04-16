defmodule Foodtruckmatch.Location.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :name, :string
    field :address, :string
    field :items, :string
    field :latitude, :float
    field :longitude, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:name, :address, :latitude, :longitude, :items])
    |> validate_required([:name, :address, :latitude, :longitude, :items])
  end
end
