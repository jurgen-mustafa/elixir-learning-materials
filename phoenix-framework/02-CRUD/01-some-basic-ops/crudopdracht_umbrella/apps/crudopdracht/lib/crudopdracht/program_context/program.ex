defmodule Crudopdracht.ProgramContext.Program do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crudopdracht.CourseContext.Course

  schema "programs" do
    field(:name, :string)

    many_to_many(:courses, Course,
      join_through: "courses_programs",
      on_delete: :delete_all,
      on_replace: :delete
    )
  end

  @doc false
  def changeset(program, attrs) do
    courses = Crudopdracht.CourseContext.get_courses(attrs["courses"])

    program
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> put_assoc(:courses, courses)
  end
end
