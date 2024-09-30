defmodule TheArcaneEnclave.MwbModels.Evolve.Inbound.RawWires do
  use TheArcaneEnclave.Mercury.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "evolve_raw_inbound_wires" do
    field :imad, :string
  end
end
