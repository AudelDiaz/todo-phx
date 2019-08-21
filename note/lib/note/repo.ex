defmodule Note.Repo do
  use Ecto.Repo,
    otp_app: :note,
    adapter: Ecto.Adapters.Postgres
end
