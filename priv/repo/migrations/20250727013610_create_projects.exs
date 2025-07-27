defmodule Pathvoid.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string, null: false
      add :description, :text, null: false
      add :url, :string, null: false
      add :status, :string, null: false

      timestamps()
    end

    create index(:projects, [:name])
    create index(:projects, [:status])
  end
end
