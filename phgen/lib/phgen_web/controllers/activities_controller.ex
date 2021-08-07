defmodule PhgenWeb.ActivitiesController do
  use PhgenWeb, :controller

  alias Phgen.Todos
  alias Phgen.Todos.Activities

  def index(conn, _params) do
    activities = Todos.list_activities()
    render(conn, "index.html", activities: activities)
  end

  def new(conn, _params) do
    changeset = Todos.change_activities(%Activities{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"activities" => activities_params}) do
    case Todos.create_activities(activities_params) do
      {:ok, activities} ->
        conn
        |> put_flash(:info, "Activities created successfully.")
        |> redirect(to: Routes.activities_path(conn, :show, activities))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    activities = Todos.get_activities!(id)
    render(conn, "show.html", activities: activities)
  end

  def edit(conn, %{"id" => id}) do
    activities = Todos.get_activities!(id)
    changeset = Todos.change_activities(activities)
    render(conn, "edit.html", activities: activities, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activities" => activities_params}) do
    activities = Todos.get_activities!(id)

    case Todos.update_activities(activities, activities_params) do
      {:ok, activities} ->
        conn
        |> put_flash(:info, "Activities updated successfully.")
        |> redirect(to: Routes.activities_path(conn, :show, activities))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", activities: activities, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    activities = Todos.get_activities!(id)
    {:ok, _activities} = Todos.delete_activities(activities)

    conn
    |> put_flash(:info, "Activities deleted successfully.")
    |> redirect(to: Routes.activities_path(conn, :index))
  end
end
