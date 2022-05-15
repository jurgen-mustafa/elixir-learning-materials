defmodule UserCatsRefWeb.CatView do
  use UserCatsRefWeb, :view

  alias UserCatsRefWeb.CatView

  def render("index.json", %{cats: cats}) do
    # Create a json with key = data & value = an array of cats. The render_many is used to call render on every attribute in the (cats)-list
    %{data: render_many(cats, CatView, "cat.json")}
  end

  def render("show.json", %{cat: cat}) do
    # Create a json with key = data & value = a dictionary of a single cat.
    %{data: render_one(cat, CatView, "cat.json")}
  end

  # render(show.json, cat) & render(index.json, cats) call this function to know how to exactly create a json of a cat attribute.
  def render("cat.json", %{cat: cat}) do
    %{id: cat.id, name: cat.name}
  end
end
