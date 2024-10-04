defmodule TheArcaneEnclave.MwbModels.Column.Inbound.International.MercuryLink do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key false
  # import Ecto.Changeset

  schema "column_inbound_international_wire_mercury_links" do
    field :column_id, :string
    field :partner_link_id, :binary_id

    has_one :exogenous_money_movement, TheArcaneEnclave.MwbModels.ExogenousMoneyMovementPartnerLink, foreign_key: :id, references: :partner_link_id
  end
end
