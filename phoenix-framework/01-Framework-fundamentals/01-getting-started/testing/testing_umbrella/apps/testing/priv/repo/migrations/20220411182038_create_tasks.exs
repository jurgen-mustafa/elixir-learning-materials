defmodule Testing.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add(:title, :string)
      add(:deadline, :date)
      # New stuff below
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
