defmodule Foodtruckmatch.LocationTest do
  use Foodtruckmatch.DataCase

  alias Foodtruckmatch.Location

  describe "trucks" do
    alias Foodtruckmatch.Location.Truck

    import Foodtruckmatch.LocationFixtures

    @invalid_attrs %{name: nil, address: nil, items: nil, latitude: nil, longitude: nil}

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Location.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Location.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{name: "some name", address: "some address", items: "some items", latitude: 120.5, longitude: 120.5}

      assert {:ok, %Truck{} = truck} = Location.create_truck(valid_attrs)
      assert truck.name == "some name"
      assert truck.address == "some address"
      assert truck.items == "some items"
      assert truck.latitude == 120.5
      assert truck.longitude == 120.5
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", items: "some updated items", latitude: 456.7, longitude: 456.7}

      assert {:ok, %Truck{} = truck} = Location.update_truck(truck, update_attrs)
      assert truck.name == "some updated name"
      assert truck.address == "some updated address"
      assert truck.items == "some updated items"
      assert truck.latitude == 456.7
      assert truck.longitude == 456.7
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_truck(truck, @invalid_attrs)
      assert truck == Location.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Location.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Location.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Location.change_truck(truck)
    end
  end
end
