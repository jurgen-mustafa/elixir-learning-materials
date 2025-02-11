defmodule UserCatsRef.UserContextTest do
  use UserCatsRef.DataCase

  alias UserCatsRef.UserContext

  describe "users" do
    alias UserCatsRef.UserContext.User

    import UserCatsRef.UserContextFixtures

    @invalid_attrs %{date_of_birth: nil, first_name: nil, last_name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert UserContext.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert UserContext.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{date_of_birth: ~D[2022-05-03], first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %User{} = user} = UserContext.create_user(valid_attrs)
      assert user.date_of_birth == ~D[2022-05-03]
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserContext.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{date_of_birth: ~D[2022-05-04], first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %User{} = user} = UserContext.update_user(user, update_attrs)
      assert user.date_of_birth == ~D[2022-05-04]
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = UserContext.update_user(user, @invalid_attrs)
      assert user == UserContext.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = UserContext.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> UserContext.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = UserContext.change_user(user)
    end
  end
end
