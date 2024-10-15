defmodule TheArcaneEnclave.WireDetails do
  @moduledoc """
  The WireDetails context.
  """

  import Ecto.Query, warn: false
  alias TheArcaneEnclave.MercuryRepo

  alias TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire, as: ColumnInternational

  @doc """
  Returns the list of column_inbound_international_wires.

  ## Examples

      iex> list_column_inbound_international_wires()
      [%ColumnInboundInternationalWires{}, ...]

  """
  def list_column_inbound_international_wires do
    ColumnInternational
    |> MercuryRepo.all()
    |> TheArcaneEnclave.MercuryRepo.preload([:mercury_link, mercury_link: [exogenous_money_movement: [money_movements: :transaction_metadata]]])
  end

  @doc """
  Gets a single column_inbound_international_wires.

  Raises if the Column inbound international wires does not exist.

  ## Examples

      iex> get_column_inbound_international_wires!(123)
      %ColumnInboundInternationalWires{}

  """
  def get_column_inbound_international_wires!(id) do
    ColumnInternational
    |> MercuryRepo.get_by(column_id: id)
    |> TheArcaneEnclave.MercuryRepo.preload([:states, :mercury_link, mercury_link: [exogenous_money_movement: [money_movements: :transaction_metadata]]])
  end
end
