defmodule Pathvoid.Repo do
  @moduledoc """
  Database repository configuration using Ecto with PostgreSQL.
  """

  use Ecto.Repo,
    otp_app: :pathvoid,
    adapter: Ecto.Adapters.Postgres
end
