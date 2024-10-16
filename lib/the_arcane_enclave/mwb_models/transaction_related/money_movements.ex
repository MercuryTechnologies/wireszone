defmodule TheArcaneEnclave.MwbModels.TransactionRelated.MoneyMovement do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  # import Ecto.Changeset

  schema "money_movements" do
    belongs_to :transaction_metadata, TheArcaneEnclave.MwbModels.TransactionRelated.TransactionMetadata, foreign_key: :originating_transaction_id
    belongs_to :exogenous_money_movement_partner_link, TheArcaneEnclave.MwbModels.TransactionRelated.ExogenousMoneyMovementPartnerLink, foreign_key: :money_movement_id, references: :id
    # belongs_to :exogenous_money_movement_partner_link, TheArcaneEnclave.MwbModels.TransactionRelated.EndogenousMoneyMovementPartnerLink, foreign_key: :money_movement_id, references: :id
  end
end
