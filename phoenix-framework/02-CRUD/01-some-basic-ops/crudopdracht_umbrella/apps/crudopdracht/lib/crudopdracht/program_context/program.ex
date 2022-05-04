defmodule Crudopdracht.ProgramContext.Program do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crudopdracht.CourseContext.Course

  schema "programs" do
    field(:name, :string)

    many_to_many(:courses, Course, join_through: "courses_programs", on_delete: :delete_all)
  end

  @doc false
  def changeset(program, attrs) do
    program
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
