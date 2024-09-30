defmodule TheArcaneEnclave.WireDetailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TheArcaneEnclave.WireDetails` context.
  """

  @doc """
  Generate a column_inbound_international_wires.
  """
  def column_inbound_international_wires_fixture(attrs \\ %{}) do
    {:ok, column_inbound_international_wires} =
      attrs
      |> Enum.into(%{

      })
      |> TheArcaneEnclave.WireDetails.create_column_inbound_international_wires()

    column_inbound_international_wires
  end
end
