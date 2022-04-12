defmodule CrudopdrachtWeb.PageController do
  use CrudopdrachtWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
