defmodule TheArcaneEnclave.MwbModels.TransactionRelated.ExogenousMoneyMovementPartnerLink do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "exogenous_money_movement_partner_link" do
    belongs_to :money_movement, TheArcaneEnclave.MwbModels.TransactionRelated.MoneyMovement, references: :money_movement_id, type: :binary_id
  end
end
