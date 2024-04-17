defmodule FoodtruckmatchWeb.TruckLive.Show do
  use FoodtruckmatchWeb, :live_view

  alias Foodtruckmatch.Location

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id, "term" => term}, _, socket) do
    {:noreply,
     socket
     |> assign(:truck, Location.get_truck!(id))
     |> assign(:term, term)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:truck, Location.get_truck!(id))
     |> assign(:term, nil)}
  end
end
