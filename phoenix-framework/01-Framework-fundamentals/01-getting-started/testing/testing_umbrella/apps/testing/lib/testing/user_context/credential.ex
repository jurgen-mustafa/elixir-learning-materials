defmodule Testing.UserContext.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Testing.UserContext.User

  schema "credentials" do
    field(:password, :string)
    field(:username, :string)
    # New stuff below
    belongs_to(:user, User)
    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
  end
end
