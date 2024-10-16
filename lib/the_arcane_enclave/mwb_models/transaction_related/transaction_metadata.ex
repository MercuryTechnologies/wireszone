defmodule TheArcaneEnclave.MwbModels.TransactionRelated.TransactionMetadata do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  # import Ecto.Changeset

  schema "transaction_metadata" do
    field :amount, :decimal

    has_many :money_movements, TheArcaneEnclave.MwbModels.TransactionRelated.MoneyMovement, foreign_key: :originating_transaction_id, references: :id
  end
end
