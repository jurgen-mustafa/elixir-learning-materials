defmodule CrudopdrachtWeb.ProgramController do
  use CrudopdrachtWeb, :controller

  alias Crudopdracht.ProgramContext
  alias Crudopdracht.ProgramContext.Program
  alias Crudopdracht.CourseContext
  alias Crudopdracht.CourseContext.Course

  def index(conn, _params) do
    programs = ProgramContext.list_programs()
    render(conn, "index.html", programs: programs)
  end

  def new(conn, _params) do
    changeset = ProgramContext.change_program(%Program{})
    courses = CourseContext.list_courses()
    program = %Program{} |> Crudopdracht.Repo.preload(:courses)
    render(conn, "new.html", changeset: changeset, courses: courses, program: program)
  end

  def create(conn, %{"program" => program_params}) do
    # IO.puts(program_params)

    # require IEx
    # IEx.pry()

    case ProgramContext.create_program(program_params) do
      {:ok, program} ->
        conn
        |> put_flash(:info, "Program created successfully.")
        |> redirect(to: Routes.program_path(conn, :show, program))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    # programs = ProgramContext.list_programs()
    # render(conn, "index.html", programs: programs)
  end

  def show(conn, %{"id" => id}) do
    program = ProgramContext.get_program!(id) |> Crudopdracht.Repo.preload(:courses)
    render(conn, "show.html", program: program)
  end

  def edit(conn, %{"id" => id}) do
    program = ProgramContext.get_program!(id) |> Crudopdracht.Repo.preload(:courses)
    changeset = ProgramContext.change_program(program)

    courses = CourseContext.list_courses()
    render(conn, "edit.html", program: program, changeset: changeset, courses: courses)
  end

  def update(conn, %{"id" => id, "program" => program_params}) do
    program = ProgramContext.get_program!(id)

    case ProgramContext.update_program(program, program_params) do
      {:ok, program} ->
        conn
        |> put_flash(:info, "Program updated successfully.")
        |> redirect(to: Routes.program_path(conn, :show, program))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", program: program, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    program = ProgramContext.get_program!(id)
    {:ok, _program} = ProgramContext.delete_program(program)

    conn
    |> put_flash(:info, "Program deleted successfully.")
    |> redirect(to: Routes.program_path(conn, :index))
  end
end
