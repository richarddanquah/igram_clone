defmodule IgramClone.Repo do
  use Ecto.Repo,
    otp_app: :igram_clone,
    adapter: Ecto.Adapters.Postgres
end
