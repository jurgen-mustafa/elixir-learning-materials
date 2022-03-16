defmodule AppWeb.PageController do
  use AppWeb, :controller

  def index(conn, _params) do
    # gebruik dit om te debuggen
    # require IEx;
    # IEx.pry()
    render(conn, "index.html")
  end

  def temp(conn, _params) do
    rand = 50
    render(conn, "temp.html", rand: Epicrandom.random(rand))
  end
end
