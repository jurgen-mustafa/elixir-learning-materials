defmodule TestingWeb.UserController do
  use TestingWeb, :controller

  alias Testing.UserContext
  alias Testing.UserContext.User

  def new(conn, _parameters) do
    changeset = UserContext.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case UserContext.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User #{user.first_name} #{user.last_name} created successfully.")
        |> redirect(to: Routes.user_path(conn, :new))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    users = UserContext.list_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"user_id" => id}) do
    user = UserContext.get_user!(id)
    render(conn, "show.html", user: user)
  end
end
