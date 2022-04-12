defmodule Testing.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add(:username, :string)
      add(:password, :string)
      # New stuff below
      add(:user_id, references(:users))
      timestamps()
    end

    create(unique_index(:credentials, [:user_id]))
  end
end
