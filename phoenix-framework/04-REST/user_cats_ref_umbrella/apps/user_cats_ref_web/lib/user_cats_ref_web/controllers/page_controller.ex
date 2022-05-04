defmodule UserCatsRefWeb.PageController do
  use UserCatsRefWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
