defmodule Foodtruckmatch.Repo do
  use Ecto.Repo,
    otp_app: :foodtruckmatch,
    adapter: Ecto.Adapters.Postgres
end
