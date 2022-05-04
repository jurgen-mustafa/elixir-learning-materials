defmodule Crudopdracht.ProgramContext do
  @moduledoc """
  The ProgramContext context.
  """

  import Ecto.Query, warn: false
  alias Crudopdracht.Repo

  alias Crudopdracht.ProgramContext.Program
  alias Crudopdracht.CourseContext.Course
  alias Crudopdracht.CourseContext

  @doc """
  Returns the list of programs.

  ## Examples

      iex> list_programs()
      [%Program{}, ...]

  """
  def list_programs do
    Repo.all(Program)
  end

  @doc """
  Gets a single program.

  Raises `Ecto.NoResultsError` if the Program does not exist.

  ## Examples

      iex> get_program!(123)
      %Program{}

      iex> get_program!(456)
      ** (Ecto.NoResultsError)

  """
  def get_program!(id) do: Repo.get!(Program, id)

  @doc """
  Creates a program.

  ## Examples

      iex> create_program(%{field: value})
      {:ok, %Program{}}

      iex> create_program(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_program(attrs \\ %{}) do
    %Program{}
    |> Repo.preload([:courses])
    |> Program.changeset(attrs)
    |> maybe_put_courses(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a program.

  ## Examples

      iex> update_program(program, %{field: new_value})
      {:ok, %Program{}}

      iex> update_program(program, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_program(%Program{} = program, attrs) do
    program
    |> Repo.preload(:courses)
    |> Program.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a program.

  ## Examples

      iex> delete_program(program)
      {:ok, %Program{}}

      iex> delete_program(program)
      {:error, %Ecto.Changeset{}}

  """
  def delete_program(%Program{} = program) do
    Repo.delete(program)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking program changes.

  ## Examples

      iex> change_program(program)
      %Ecto.Changeset{data: %Program{}}

  """
  def change_program(%Program{} = program, attrs \\ %{}) do
    program
    |> Repo.preload(:courses)
    |> Program.changeset(attrs)
  end

  defp maybe_put_courses(changeset, []), do: changeset

  defp maybe_put_courses(changeset, attr) do
    courses = CourseContext.get_courses(attr["courses"])

    Ecto.Changeset.put_assoc(changeset, :courses, courses)
  end

  # defp maybe_put_amenities(changeset, []), do: changeset

  # defp maybe_put_amenities(changeset, attrs) do
  #   amenities = Amenities.get_amenities(attrs["amenities"])

  #   Changeset.put_assoc(changeset, :amenities, amenities)
  # end
end
