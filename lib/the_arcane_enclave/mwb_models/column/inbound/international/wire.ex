defmodule TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key false
  # import Ecto.Changeset

  schema "column_inbound_international_wires" do
    field :column_id, :string
    field :wire_data, :map

    has_many :states, TheArcaneEnclave.Mercury.Column.Inbound.International.WireStates, foreign_key: :wire_id, references: :column_id
  end
end
