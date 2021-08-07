defmodule PhgenWeb.PageController do
  use PhgenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
