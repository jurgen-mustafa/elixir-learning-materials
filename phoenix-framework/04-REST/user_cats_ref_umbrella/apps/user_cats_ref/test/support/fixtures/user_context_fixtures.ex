defmodule UserCatsRef.UserContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UserCatsRef.UserContext` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        date_of_birth: ~D[2022-05-03],
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> UserCatsRef.UserContext.create_user()

    user
  end
end
