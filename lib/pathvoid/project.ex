defmodule Pathvoid.Project do
  @moduledoc """
  Project schema for managing project entries.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :description, :string
    field :url, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Creates a changeset for the Project schema.
  """
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :url, :status])
    |> validate_required([:name, :description, :url, :status])
    |> validate_inclusion(:status, ["completed", "in-progress", "planning"])
  end
end
