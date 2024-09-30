defmodule TheArcaneEnclave.MercuryRepo do
  use Ecto.Repo,
    otp_app: :the_arcane_enclave,
    adapter: Ecto.Adapters.Postgres
end
