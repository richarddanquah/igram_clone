defmodule IgramCloneWeb.PageController do
  use IgramCloneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
