defmodule FoodtruckmatchWeb.TruckLive.SearchComponent do
  use FoodtruckmatchWeb, :live_component

  alias Foodtruckmatch.Location

  @impl true
  def render(assigns) do
    ~H"""
      <div>
        <.simple_form
          for={@form}
          id="search-form"
          phx-target={@myself}
          phx-submit="save"
        >
          <.input field={@form[:term]} type="text" label="search" value={@value} />
          <:actions>
            <.button phx-disable-with="Searching...">Search</.button>
            <.link navigate={~p"/"}>clear</.link>
          </:actions>
        </.simple_form>
      </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    changeset = Location.change_search(%Location.Search{})

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"search" => search_params}, socket) do
    changeset =
      socket.assigns.search
      |> Location.change_search(search_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"search" => search_params}, socket) do
    process_search(socket, search_params)
  end

  defp process_search(socket, search_params) do
    notify_parent({:search, search_params})
    {:noreply, socket}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
