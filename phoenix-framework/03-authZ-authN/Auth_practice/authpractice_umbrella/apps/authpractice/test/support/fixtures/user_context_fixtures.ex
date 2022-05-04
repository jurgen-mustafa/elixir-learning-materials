defmodule Authpractice.UserContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Authpractice.UserContext` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        hashed_password: "some hashed_password",
        role: "some role",
        username: "some username"
      })
      |> Authpractice.UserContext.create_user()

    user
  end
end
