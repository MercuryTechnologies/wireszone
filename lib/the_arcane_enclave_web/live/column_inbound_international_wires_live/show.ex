defmodule TheArcaneEnclaveWeb.ColumnColumnInboundInternationalWiresLive.Show do
  use TheArcaneEnclaveWeb, :live_view

  alias TheArcaneEnclave.WireDetails
  alias TheArcaneEnclave.MockGenserver
  alias TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.MockCallComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(messages: [])}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:column_inbound_international_wires, WireDetails.get_column_inbound_international_wires!(id))}
  end

  @impl true
  def handle_event("start_process", _params, socket) do
    # Start the process and cast to GenServer
    MockGenserver.staged_responses(self())
    {:noreply, assign(socket, loading: true)}
  end

  @impl true
  def handle_info({:genserver_response, message}, socket) do
    IO.inspect(message, label: "show genserver response")
    send_update self(), MockCallComponent, id: "blah", messages: socket.assigns.messages ++ [message]
    {:noreply, assign(socket, messages: socket.assigns.messages ++ [message])}
  end

  defp page_title(:show), do: "Show Column inbound international wires"
  defp page_title(:edit), do: "Edit Column inbound international wires"
end
