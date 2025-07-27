defmodule Pathvoid.Repo.Migrations.CreateApps do
  use Ecto.Migration

  def change do
    create table(:apps) do
      add :name, :string, null: false
      add :url, :string, null: false
      add :icon, :text, null: false
      add :color, :string

      timestamps()
    end

    create index(:apps, [:name])
  end
end
