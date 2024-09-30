defmodule TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.MockCallComponent do
  use TheArcaneEnclaveWeb, :live_component

  alias TheArcaneEnclave.MockGenserver

  def mount(socket) do
    {:ok, assign(socket, messages: [], loading: false)}
  end

  def update(assigns, socket) do
    {:ok, socket |> assign(messages: assigns.messages)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>GenServer Demo Component</h1>

      <button
        phx-click="start_process"
        phx-disable-with="Processing..."
        >Start Process</button>

      <div>
        <%= for message <- @messages do %>
          <p><%= message %></p>
        <% end %>
      </div>
    </div>
    """
  end

  def handle_event("start_process", _params, socket) do
    # Start the process and cast to GenServer
    MockGenserver.staged_responses(self())
    {:noreply, assign(socket, loading: true)}
  end

  def handle_info({:genserver_response, message}, socket) do
    # Handle the response from GenServer and update the component
    IO.inspect(message, label: "handle_info")
    {:noreply, assign(socket, messages: socket.assigns.messages ++ [message])}
  end
end
