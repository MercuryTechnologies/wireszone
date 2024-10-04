defmodule TheArcaneEnclave.MwbModels.MoneyMovements do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  # import Ecto.Changeset

  schema "money_movements" do
    field :originating_transaction_id, :binary_id

    has_one :transaction_metadata, TheArcaneEnclave.MwbModels.TransactionMetadata, foreign_key: :id, references: :originating_transaction_id
  end
end
