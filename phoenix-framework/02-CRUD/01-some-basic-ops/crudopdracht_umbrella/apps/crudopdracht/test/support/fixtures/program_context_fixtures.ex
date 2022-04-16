defmodule Crudopdracht.ProgramContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crudopdracht.ProgramContext` context.
  """

  @doc """
  Generate a program.
  """
  def program_fixture(attrs \\ %{}) do
    {:ok, program} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Crudopdracht.ProgramContext.create_program()

    program
  end
end
