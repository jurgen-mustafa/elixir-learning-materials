defmodule Testing.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Testing.TaskContext.Task
  alias Testing.UserContext.Credential

  schema "users" do
    field(:date_of_birth, :date)
    field(:first_name, :string)
    field(:last_name, :string)

    many_to_many(:tasks, Task, join_through: "users_tasks")
    has_one(:credential, Credential)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :date_of_birth])
    |> validate_required([:first_name, :last_name, :date_of_birth])
    |> cast_assoc(:credential)
    |> unique_constraint(:date_of_birth,
      name: :unique_users_index,
      message:
        "Wow that's coincidence! " <>
          "Another person with the same first name and last name was born at this day. " <>
          "Oh gosh, our system can't deal with this. " <>
          "Contact our administrators or change your name. "
    )
  end
end
