defmodule TheArcaneEnclave.MwbModels.TransactionRelated.EndogenousMoneyMovementPartnerLink do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "endogenous_money_movement_partner_link" do
    field :money_movement_id, :binary_id

    has_many :money_movements, TheArcaneEnclave.MwbModels.TransactionRelated.MoneyMovements, foreign_key: :id, references: :money_movement_id
  end
end
