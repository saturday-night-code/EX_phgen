defmodule Phgen.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :activity_id, :integer
      add :name, :string
      add :owner, :string

      timestamps()
    end

    create unique_index(:activities, [:activity_id])
  end
end
