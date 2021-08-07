defmodule Phgen.Repo do
  use Ecto.Repo,
    otp_app: :phgen,
    adapter: Ecto.Adapters.Postgres
end
