defmodule TheArcaneEnclave.WiresSearcher do
  import Ecto.Query

  alias TheArcaneEnclave.MercuryRepo
  alias TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire, as: ColumnInternational
  alias TheArcaneEnclave.MwbModels.Column.Inbound.Domestic.Wire, as: ColumnDomestic
  alias TheArcaneEnclave.MwbModels.Evolve.Inbound.{RawWires}

  def search_for_wire("2025" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2024" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2023" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2022" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2021" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2020" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2019" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("2018" <> _rest = imad), do: search_by_imad(imad)
  def search_for_wire("swft_" <> _ = column_id), do: search_column_international_wires(column_id)
  def search_for_wire("wire_" <> _ = column_id), do: search_column_domestic_wires(column_id)
  def search_for_wire(id) do
    # Try by transaction metadata

  end

  def search_column_international_wires(column_id) do
    from(w in ColumnInternational, where: w.column_id == ^column_id)
    |> MercuryRepo.all()
  end

  def search_column_domestic_wires(column_id) do
    query = from w in ColumnDomestic,
      where: w.column_id == ^column_id
      MercuryRepo.all(query)
  end

  def search_by_imad(imad) do
    # https://elixirforum.com/t/custom-ecto-postgrex-types-for-point-data-type/14404
    %{
      column_domestic_wires:
        from(w in ColumnDomestic, where: w.imad == ^imad)
        |> MercuryRepo.preload(:states, order_by: :created_at),
      evolve_raw_inbound_wires:
        from(w in RawWires, where: w.imad == ^imad)
        |> MercuryRepo.all
    }
  end
end
