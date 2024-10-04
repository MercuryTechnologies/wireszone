defmodule TheArcaneEnclave.MwbModels.ExogenousMoneyMovementPartnerLink do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "exogenous_money_movement_partner_link" do
    field :money_movement_id, :binary_id

    has_many :money_movements, TheArcaneEnclave.MwbModels.MoneyMovements, foreign_key: :id, references: :money_movement_id
  end
end
