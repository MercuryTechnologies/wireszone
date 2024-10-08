defmodule TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.NestedMapComponent do
  use TheArcaneEnclaveWeb, :live_component
  use TheArcaneEnclaveWeb, :html

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-6 bg-gray-100 rounded-lg shadow-md max-w-none mx-0.5 w-full">
      <h2 class="text-2xl font-bold mb-4">Raw Wire Attributes</h2>
      <div class="bg-blue-50 border-l-4 border-blue-400 p-4 rounded mb-8">
        <p class="text-blue-700 font-medium">These are the attributes we have from the latest message that Column has given us about this wire</p>
      </div>
      <%!-- <%= render_map(@wire_data) %> --%>
      <.render_map map={@wire_data} />
    </div>
    """
  end
  # Recursive function component to render a map with Tailwind CSS and CSS Grid
  defp render_map(assigns) do
    ~H"""
    <div class="grid">
      <%= for {{key, value}, index} <- Enum.with_index(Enum.to_list(@map)) do %>
        <%= if is_map(value) do %>
          <div class="mb-4">
            <p class="font-semibold text-gray-800"><%= titleize(key) %>:</p>
            <div class="ml-6 bg-white p-4 border-l-4 border-blue-500 rounded-md">
              <.render_map map={value} />
            </div>
          </div>
        <% else %>
          <div class="grid grid-cols-[minmax(150px,auto)_1fr] gap-2 items-start border-b-[6px] border-dashed border-purple-200">
            <span class="font-semibold text-gray-800"><%= titleize(key) %>:</span>
            <span
              class="text-gray-600 copyable"
              id={"info-#{index}"}
              phx-click={
                JS.dispatch("my_app:clipcopy")
                |> JS.add_class("copied", to: "#info-#{index}")
                }
            ><%= value %></span>
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end

  defp titleize(k) do
    k |> String.split("_") |> Enum.map(fn x -> String.capitalize(x) end) |> Enum.join(" ")
  end
end
