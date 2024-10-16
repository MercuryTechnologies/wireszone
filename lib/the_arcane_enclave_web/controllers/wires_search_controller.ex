defmodule TheArcaneEnclaveWeb.WiresSearchController do
  use TheArcaneEnclaveWeb, :controller

  alias TheArcaneEnclave.WiresSearcher
  alias TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire, as: ColumnInternational
  alias TheArcaneEnclave.MwbModels.Column.Inbound.Domestic.Wire, as: ColumnDomestic
  alias TheArcaneEnclave.MwbModels.Evolve.Inbound.RawWires

  def wires_search(conn, %{"search_for" => search_term}) do
    search_result = WiresSearcher.search_for_wire(search_term)
    case search_result do
      [%ColumnDomestic{} | _] ->
        render(conn, :column_inbound_domestic_wires, wires: search_result)
      [%ColumnInternational{} | _] ->
        render(conn, :column_inbound_international_wires, wires: search_result)
      %{
        column_domestic_wires: [],
        evolve_raw_inbound_wires: [%RawWires{} | _] = evolve_wires
      } ->
        render(conn, :evolve_inbound_wires, wires: evolve_wires)
      %{
        column_domestic_wires: [%ColumnDomestic{} | _] = column_wires,
        evolve_raw_inbound_wires: []
      } ->
        render(conn, :column_inbound_domestic_wires, wires: column_wires)
      %{
        column_domestic_wires: [%ColumnDomestic{} | _],
        evolve_raw_inbound_wires: [%RawWires{} | _]
      } ->
        render(conn, :something_is_severely_jacked, wires: search_result)
      %TheArcaneEnclave.MwbModels.TransactionRelated.TransactionMetadata{} ->
        render(conn, :transaction, transaction: search_result)
      %{} ->
        render(conn, :no_results)
      end
    render(conn, :results)
  end

  def wires_search(conn, _params) do
    render(conn, :no_search)
  end
end
