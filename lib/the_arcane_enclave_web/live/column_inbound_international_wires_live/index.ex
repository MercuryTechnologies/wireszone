defmodule TheArcaneEnclaveWeb.ColumnColumnInboundInternationalWiresLive.Index do
  use TheArcaneEnclaveWeb, :live_view

  alias TheArcaneEnclave.WireDetails
  alias TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire, as: ColumnInternational

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :column_inbound_international_wires_collection, WireDetails.list_column_inbound_international_wires())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Column inbound international wires")
    |> assign(:column_inbound_international_wires, WireDetails.get_column_inbound_international_wires!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Column inbound international wires")
    |> assign(:column_inbound_international_wires, %ColumnInternational{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Column inbound international wires")
    |> assign(:column_inbound_international_wires, nil)
  end

  @impl true
  def handle_info({TheArcaneEnclaveWeb.ColumnColumnInboundInternationalWiresLive.FormComponent, {:saved, column_inbound_international_wires}}, socket) do
    {:noreply, stream_insert(socket, :column_inbound_international_wires_collection, column_inbound_international_wires)}
  end
end
