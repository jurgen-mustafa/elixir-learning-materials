# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Authpractice.Repo.insert!(%Authpractice.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, _cs} =
  Authpractice.UserContext.create_user(%{
    "password" => "t",
    "role" => "User",
    "username" => "user"
  })

{:ok, _cs} =
  Authpractice.UserContext.create_user(%{
    "password" => "t",
    "role" => "Manager",
    "username" => "manager"
  })

{:ok, _cs} =
  Authpractice.UserContext.create_user(%{
    "password" => "t",
    "role" => "Admin",
    "username" => "admin"
  })
