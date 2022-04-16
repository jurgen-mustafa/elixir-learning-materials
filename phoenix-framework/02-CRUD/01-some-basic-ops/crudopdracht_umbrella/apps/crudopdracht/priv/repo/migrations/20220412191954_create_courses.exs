defmodule Crudopdracht.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add(:name, :string)
    end
  end
end
