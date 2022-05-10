# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Crudopdracht.Repo.insert!(%Crudopdracht.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Crudopdracht.CourseContext
alias Crudopdracht.ProgramContext
# alias Crudopdracht.CourseContext.Course
# alias Crudopdracht.ProgramContext.Program

{:ok, _program} = ProgramContext.create_program(%{name: "Computer Science"})
{:ok, _course} = CourseContext.create_course(%{name: "Math 1"})
{:ok, _course2} = CourseContext.create_course(%{name: "Communication"})
