defmodule Foodtruckmatch.LocationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Foodtruckmatch.Location` context.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    {:ok, truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        items: "some items",
        latitude: 120.5,
        longitude: 120.5,
        name: "some name"
      })
      |> Foodtruckmatch.Location.create_truck()

    truck
  end
end
