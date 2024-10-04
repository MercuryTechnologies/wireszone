defmodule TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.TransactionDetailsComponent do
  use TheArcaneEnclaveWeb, :live_component

  def mount(socket) do
    {:ok, assign(socket, loading: false, money_movements: [])}
  end

  def update(assigns, socket) do
    {:ok,
    socket
    |> assign(assigns)
   }
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-row">
      <%= for mm <- @money_movements do %>
        <p><%= mm.transaction_metadata.amount %></p>
        <button
          phx-click="do-thing"
        >My Button</button>
      <% end %>
    </div>
    """
  end

  def handle_event("start_process", _params, socket) do
    # Start the process and cast to GenServer
    {:noreply, assign(socket, loading: true)}
  end

  def handle_event("do_thing", _params, socket) do
    # Start the process and cast to GenServer
    Finch.build(:post, "http://localhost:3000/wires-zone/request-return")
    |> Finch.request(TheArcaneEnclave.Finch)
    |> IO.inspect
    {:noreply, assign(socket, loading: true)}
  end

  def handle_info({:genserver_response, message}, socket) do
    # Handle the response from GenServer and update the component
    IO.inspect(message, label: "handle_info")
    {:noreply, assign(socket, messages: socket.assigns.messages ++ [message])}
  end
end
