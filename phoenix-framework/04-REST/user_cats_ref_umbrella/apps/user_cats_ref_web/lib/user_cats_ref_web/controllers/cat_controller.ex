defmodule UserCatsRefWeb.CatController do
  use UserCatsRefWeb, :controller

  alias UserCatsRef.UserContext

  alias UserCatsRef.CatContext
  alias UserCatsRef.CatContext.Cat

  def index(conn, %{"user_id" => user_id}) do
    # Retrieve the user with the given user_id
    user = UserContext.get_user!(user_id)

    # Add the cats to the given user. As elixir is a functional programming language, user will not be updated but a new structure is returned.
    user_with_loaded_cats = CatContext.load_cats(user)

    # Render the cats following index.json.
    render(conn, "index.json", cats: user_with_loaded_cats.cats)
  end

  def create(conn, %{"user_id" => user_id, "cat" => cat_params}) do
    # Get the user structure based on its user_id
    user = UserContext.get_user!(user_id)

    # Call create_cat function from the CatContext
    case CatContext.create_cat(cat_params, user) do
      # If creation was successful, let the end user know about the creation
      {:ok, %Cat{} = cat} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_cat_path(conn, :show, user_id, cat))
        # Notice the show.json instead of show.html! show.json does not yet exists but will be created later in this guide.
        |> render("show.json", cat: cat)

      # If creation failed, let the end user know about the failure.
      {:error, _cs} ->
        conn
        |> send_resp(400, "Something went wrong, sorry.")
    end
  end

  def show(conn, %{"id" => id}) do
    # retrieve the cat by the given id.
    cat = CatContext.get_cat!(id)
    # render the cat following show.json
    render(conn, "show.json", cat: cat)
  end

  def update(conn, %{"id" => id, "cat" => cat_params}) do
    # Get the cat from the database
    cat = CatContext.get_cat!(id)

    # Update the cat
    case CatContext.update_cat(cat, cat_params) do
      # If the update was succesful, show the end user the updated cat
      {:ok, %Cat{} = cat} ->
        render(conn, "show.json", cat: cat)

      # If the update failed, notify the end user about the failure
      {:error, _cs} ->
        conn
        |> send_resp(400, "Something went wrong, sorry. Adjust your parameters or give up.")
    end
  end

  def delete(conn, %{"id" => id}) do
    # Get the cat from the database
    cat = CatContext.get_cat!(id)

    # Delete the cat from the database
    case CatContext.delete_cat(cat) do
      # If delete sucessfull, send a 200 message
      {:ok, %Cat{}} ->
        send_resp(conn, :no_content, "")

      # If delete failed, notify the end user about the failure
      {:error, cs} ->
        conn
        |> send_resp(400, "Something went wrong, sorry.")
    end
  end
end
