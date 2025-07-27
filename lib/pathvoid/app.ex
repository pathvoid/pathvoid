defmodule Pathvoid.App do
  @moduledoc """
  Application schema for managing app entries.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "apps" do
    field :name, :string
    field :url, :string
    field :icon, :string
    field :color, :string

    timestamps()
  end

  @doc """
  Creates a changeset for the App schema.
  """
  def changeset(app, attrs) do
    app
    |> cast(attrs, [:name, :url, :icon, :color])
    |> validate_required([:name, :url, :icon])
  end
end
