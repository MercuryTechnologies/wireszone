defmodule TheArcaneEnclave.Mercury.Column.Inbound.International.WireStates do
  use TheArcaneEnclave.Mercury.Schema
  alias TheArcaneEnclave.MwbModels.Column.Inbound.International.Wire

  @type column_status :: :terminal | :returnable | :incomplete
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :string

  schema "column_inbound_international_wire_states" do
    field :column_status, :string
    field :mercury_status, :string
    timestamps()

    belongs_to :column_inbound_international_wire,
               Wire,
               foreign_key: :wire_id,
               references: :column_id
  end

  def is_terminal_state(%__MODULE__{column_status: "ColumnInitiated"}), do: :incomplete
  def is_terminal_state(%__MODULE__{column_status: "ColumnCompleted"}), do: :returnable
  def is_terminal_state(%__MODULE__{column_status: "ColumnPendingReturn"}), do: :incomplete
  def is_terminal_state(%__MODULE__{column_status: "ColumnReturned"}), do: :terminal
end
