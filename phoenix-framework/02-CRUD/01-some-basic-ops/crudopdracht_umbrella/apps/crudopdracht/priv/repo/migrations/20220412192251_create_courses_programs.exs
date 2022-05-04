defmodule Crudopdracht.Repo.Migrations.CreateCoursesPrograms do
  use Ecto.Migration

  def change do
    create table(:courses_programs) do
      add(:course_id, references(:courses))
      add(:program_id, references(:programs))
    end

    create(unique_index(:courses_programs, [:course_id, :program_id]))
  end
end
