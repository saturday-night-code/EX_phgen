defmodule Phgen.TodosTest do
  use Phgen.DataCase

  alias Phgen.Todos

  describe "activities" do
    alias Phgen.Todos.Activities

    @valid_attrs %{activity_id: 42, name: "some name", owner: "some owner"}
    @update_attrs %{activity_id: 43, name: "some updated name", owner: "some updated owner"}
    @invalid_attrs %{activity_id: nil, name: nil, owner: nil}

    def activities_fixture(attrs \\ %{}) do
      {:ok, activities} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Todos.create_activities()

      activities
    end

    test "list_activities/0 returns all activities" do
      activities = activities_fixture()
      assert Todos.list_activities() == [activities]
    end

    test "get_activities!/1 returns the activities with given id" do
      activities = activities_fixture()
      assert Todos.get_activities!(activities.id) == activities
    end

    test "create_activities/1 with valid data creates a activities" do
      assert {:ok, %Activities{} = activities} = Todos.create_activities(@valid_attrs)
      assert activities.activity_id == 42
      assert activities.name == "some name"
      assert activities.owner == "some owner"
    end

    test "create_activities/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_activities(@invalid_attrs)
    end

    test "update_activities/2 with valid data updates the activities" do
      activities = activities_fixture()

      assert {:ok, %Activities{} = activities} =
               Todos.update_activities(activities, @update_attrs)

      assert activities.activity_id == 43
      assert activities.name == "some updated name"
      assert activities.owner == "some updated owner"
    end

    test "update_activities/2 with invalid data returns error changeset" do
      activities = activities_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_activities(activities, @invalid_attrs)
      assert activities == Todos.get_activities!(activities.id)
    end

    test "delete_activities/1 deletes the activities" do
      activities = activities_fixture()
      assert {:ok, %Activities{}} = Todos.delete_activities(activities)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_activities!(activities.id) end
    end

    test "change_activities/1 returns a activities changeset" do
      activities = activities_fixture()
      assert %Ecto.Changeset{} = Todos.change_activities(activities)
    end
  end
end
