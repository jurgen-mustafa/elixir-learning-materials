defmodule Crudopdracht.CourseContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crudopdracht.CourseContext` context.
  """

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Crudopdracht.CourseContext.create_course()

    course
  end
end
