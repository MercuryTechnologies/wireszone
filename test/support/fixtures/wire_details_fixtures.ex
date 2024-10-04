defmodule TheArcaneEnclave.WireDetailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TheArcaneEnclave.WireDetails` context.
  """

  @doc """
  Generate a column_inbound_international_wires.
  """
  def column_inbound_international_wires_fixture(_attrs \\ %{}) do
    stub_column_international_wire()
  end

  defp stub_column_international_wire do
    %TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire{ column_id: "test", wire_data: %{}}
  end
end
