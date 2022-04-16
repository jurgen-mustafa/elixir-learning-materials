defmodule Crudopdracht.ProgramContextTest do
  use Crudopdracht.DataCase

  alias Crudopdracht.ProgramContext

  describe "programs" do
    alias Crudopdracht.ProgramContext.Program

    import Crudopdracht.ProgramContextFixtures

    @invalid_attrs %{name: nil}

    test "list_programs/0 returns all programs" do
      program = program_fixture()
      assert ProgramContext.list_programs() == [program]
    end

    test "get_program!/1 returns the program with given id" do
      program = program_fixture()
      assert ProgramContext.get_program!(program.id) == program
    end

    test "create_program/1 with valid data creates a program" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Program{} = program} = ProgramContext.create_program(valid_attrs)
      assert program.name == "some name"
    end

    test "create_program/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProgramContext.create_program(@invalid_attrs)
    end

    test "update_program/2 with valid data updates the program" do
      program = program_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Program{} = program} = ProgramContext.update_program(program, update_attrs)
      assert program.name == "some updated name"
    end

    test "update_program/2 with invalid data returns error changeset" do
      program = program_fixture()
      assert {:error, %Ecto.Changeset{}} = ProgramContext.update_program(program, @invalid_attrs)
      assert program == ProgramContext.get_program!(program.id)
    end

    test "delete_program/1 deletes the program" do
      program = program_fixture()
      assert {:ok, %Program{}} = ProgramContext.delete_program(program)
      assert_raise Ecto.NoResultsError, fn -> ProgramContext.get_program!(program.id) end
    end

    test "change_program/1 returns a program changeset" do
      program = program_fixture()
      assert %Ecto.Changeset{} = ProgramContext.change_program(program)
    end
  end
end
