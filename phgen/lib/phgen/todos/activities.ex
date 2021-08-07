defmodule Phgen.Todos.Activities do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :activity_id, :integer
    field :name, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(activities, attrs) do
    activities
    |> cast(attrs, [:activity_id, :name, :owner])
    |> validate_required([:activity_id, :name, :owner])
    |> unique_constraint(:activity_id)
  end
end
