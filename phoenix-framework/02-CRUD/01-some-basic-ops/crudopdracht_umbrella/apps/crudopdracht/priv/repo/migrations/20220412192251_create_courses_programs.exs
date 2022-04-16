defmodule Crudopdracht.Repo.Migrations.CreateCoursesPrograms do
  use Ecto.Migration

  def change do
    create table(:courses_programs) do
      add(:courses_id, references(:courses))
      add(:program_id, references(:programs))
    end

    create(unique_index(:courses_programs, [:courses_id, :program_id]))
  end
end
