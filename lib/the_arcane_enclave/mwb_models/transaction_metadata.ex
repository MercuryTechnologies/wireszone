defmodule TheArcaneEnclave.MwbModels.TransactionMetadata do
  use TheArcaneEnclave.Mercury.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  # import Ecto.Changeset

  schema "transaction_metadata" do
    field :amount, :decimal
  end
end
