defmodule UserCatsRef.CatContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UserCatsRef.CatContext` context.
  """

  @doc """
  Generate a cat.
  """
  def cat_fixture(attrs \\ %{}) do
    {:ok, cat} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> UserCatsRef.CatContext.create_cat()

    cat
  end
end
