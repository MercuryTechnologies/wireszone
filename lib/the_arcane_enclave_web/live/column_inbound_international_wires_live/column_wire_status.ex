defmodule TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.ColumnWireStatus do
  use TheArcaneEnclaveWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, states: [])}
  end

  def render(assigns) do
    ~H"""
    <div class="space-y-4">
      <%= for state <- @states do %>
        <div class="flex justify-between items-center space-x-4">
          <!-- Initiated Box -->
          <div
            class={
              if state.column_status == "ColumnInitiated",
              do: "bg-yellow-500 text-white flex-1 p-4 border rounded-lg text-center",
              else: "bg-gray-200 text-gray-500 flex-1 p-4 border rounded-lg text-center"
            }>
            Initiated
          </div>

          <!-- Completed Box -->
          <div
            class={
              if state.column_status == "ColumnCompleted",
              do: "bg-green-500 text-white flex-1 p-4 border rounded-lg text-center",
              else:
                if state.column_status == "Initiated",
                do: "bg-yellow-300 text-white",
                else: "bg-gray-200 text-gray-500 flex-1 p-4 border rounded-lg text-center"}>
            Completed
          </div>

          <!-- Returned Box -->
          <div
            class={
              if state.column_status == "ColumnReturned",
              do: "bg-blue-500 text-white flex-1 p-4 border rounded-lg text-center",
              else:
                if state.column_status == "PendingReturn",
                do: "bg-yellow-300 text-white flex-1 p-4 border rounded-lg text-center",
                else: "bg-gray-200 text-gray-500 flex-1 p-4 border rounded-lg text-center"}>
            Returned
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
