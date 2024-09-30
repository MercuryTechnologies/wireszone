defmodule TheArcaneEnclave.MwbModels.Column.Inbound.Domestic.Wire do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key false
  # import Ecto.Changeset

  schema "column_inbound_domestic_wires" do
    field :column_id, :string
    field :wire_data, :map
    field :imad, :string
  end
end
