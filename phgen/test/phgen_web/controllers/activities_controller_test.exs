defmodule PhgenWeb.ActivitiesControllerTest do
  use PhgenWeb.ConnCase

  alias Phgen.Todos

  @create_attrs %{activity_id: 42, name: "some name", owner: "some owner"}
  @update_attrs %{activity_id: 43, name: "some updated name", owner: "some updated owner"}
  @invalid_attrs %{activity_id: nil, name: nil, owner: nil}

  def fixture(:activities) do
    {:ok, activities} = Todos.create_activities(@create_attrs)
    activities
  end

  describe "index" do
    test "lists all activities", %{conn: conn} do
      conn = get(conn, Routes.activities_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Activities"
    end
  end

  describe "new activities" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.activities_path(conn, :new))
      assert html_response(conn, 200) =~ "New Activities"
    end
  end

  describe "create activities" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.activities_path(conn, :create), activities: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.activities_path(conn, :show, id)

      conn = get(conn, Routes.activities_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Activities"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.activities_path(conn, :create), activities: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Activities"
    end
  end

  describe "edit activities" do
    setup [:create_activities]

    test "renders form for editing chosen activities", %{conn: conn, activities: activities} do
      conn = get(conn, Routes.activities_path(conn, :edit, activities))
      assert html_response(conn, 200) =~ "Edit Activities"
    end
  end

  describe "update activities" do
    setup [:create_activities]

    test "redirects when data is valid", %{conn: conn, activities: activities} do
      conn =
        put(conn, Routes.activities_path(conn, :update, activities), activities: @update_attrs)

      assert redirected_to(conn) == Routes.activities_path(conn, :show, activities)

      conn = get(conn, Routes.activities_path(conn, :show, activities))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, activities: activities} do
      conn =
        put(conn, Routes.activities_path(conn, :update, activities), activities: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Activities"
    end
  end

  describe "delete activities" do
    setup [:create_activities]

    test "deletes chosen activities", %{conn: conn, activities: activities} do
      conn = delete(conn, Routes.activities_path(conn, :delete, activities))
      assert redirected_to(conn) == Routes.activities_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.activities_path(conn, :show, activities))
      end
    end
  end

  defp create_activities(_) do
    activities = fixture(:activities)
    %{activities: activities}
  end
end
