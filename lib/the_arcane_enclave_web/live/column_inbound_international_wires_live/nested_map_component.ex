defmodule TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.NestedMapComponent do
  use TheArcaneEnclaveWeb, :live_component
  use TheArcaneEnclaveWeb, :html


  alias TheArcaneEnclave.WireDetails

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-6 bg-gray-100 rounded-lg shadow-md max-w-4xl mx-auto">
      <h2 class="text-2xl font-bold mb-4">Map Data</h2>
      <%!-- <%= render_map(@wire_data) %> --%>
      <.render_map map={@wire_data} />
    </div>
    """
  end
  # Recursive function component to render a map with Tailwind CSS and CSS Grid
  defp render_map(assigns) do
    ~H"""
    <div class="grid gap-4">
      <%= for {key, value} <- @map do %>
        <%= if is_map(value) do %>
          <div class="mb-4">
            <p class="font-semibold text-gray-800"><%= key %>:</p>
            <div class="ml-6 bg-white p-4 border-l-4 border-blue-500 rounded-md">
              <.render_map map={value} />
            </div>
          </div>
        <% else %>
          <div class="grid grid-cols-[minmax(150px,auto)_1fr] gap-2 items-start">
            <span class="font-semibold text-gray-800"><%= key %>:</span>
            <span class="text-gray-600"><%= value %></span>
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end
end
