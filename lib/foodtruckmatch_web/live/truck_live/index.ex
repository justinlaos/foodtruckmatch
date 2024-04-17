defmodule FoodtruckmatchWeb.TruckLive.Index do
  use FoodtruckmatchWeb, :live_view

  alias Foodtruckmatch.Location

  @impl true
  def mount(%{"term" => term}, _session, socket) do
    {:ok, stream(socket, :trucks, Location.filter_list_trucks(term))}
  end

  def mount(_params, _session, socket) do
    {:ok, stream(socket, :trucks, Location.list_trucks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, %{"term" => term}) do
    socket
    |> assign(:truck, nil)
    |> assign(:search, nil)
    |> assign(:search_term, (if term != "", do: term, else: nil))
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:truck, nil)
    |> assign(:search, nil)
    |> assign(:search_term, nil)
  end

  @impl true
  def handle_info({FoodtruckmatchWeb.TruckLive.FormComponent, {:saved, truck}}, socket) do
    {:noreply, stream_insert(socket, :trucks, truck)}
  end

  @impl true
  def handle_info({FoodtruckmatchWeb.TruckLive.SearchComponent, {:search, %{"term" => term}}}, socket) do
    {:noreply, redirect(socket, to: "/?term=#{term}")}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    truck = Location.get_truck!(id)
    {:ok, _} = Location.delete_truck(truck)

    {:noreply, stream_delete(socket, :trucks, truck)}
  end
end
