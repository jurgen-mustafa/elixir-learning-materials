defmodule Crudopdracht.CourseContext.Course do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crudopdracht.ProgramContext.Program

  schema "courses" do
    field(:name, :string)

    many_to_many(:programs, Program, join_through: "courses_programs")
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
