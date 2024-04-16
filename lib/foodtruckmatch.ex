defmodule Foodtruckmatch do
  @moduledoc """
  Foodtruckmatch keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_daily_locations do
    remove_old_truck_location_data()
    Foodtruckmatch.Service.NetworkCall.get_request("https://data.sfgov.org/resource/rqzj-sfat.json")
    |> process_new_truck_locations()
  end

  defp remove_old_truck_location_data() do
    Foodtruckmatch.Repo.delete_all(Foodtruckmatch.Location.Truck)
  end

  defp process_new_truck_locations(response) do
    Enum.each(response, fn truck_location ->
      %{ "applicant" => applicant, "address" => address, "latitude" => latitude, "longitude" => longitude } = truck_location

      items = case Map.fetch(truck_location, "fooditems") do
        {:ok, items} -> items
        :error -> "N/A"
      end

      Foodtruckmatch.Location.create_truck(%{name: applicant, address: address, latitude: latitude, longitude: longitude, items: items})
    end)
  end
end
