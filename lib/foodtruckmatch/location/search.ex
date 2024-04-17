defmodule Foodtruckmatch.Location.Search do
  use Ecto.Schema
  import Ecto.Changeset

  schema "searchs" do
    field :term, :string
  end

  @doc false
  def changeset(search, attrs) do
    search
    |> cast(attrs, [:term])
    |> validate_required([:term])
  end
end
