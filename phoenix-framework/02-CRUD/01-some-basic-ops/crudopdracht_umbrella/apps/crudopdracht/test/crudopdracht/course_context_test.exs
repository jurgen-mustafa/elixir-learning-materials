defmodule Crudopdracht.CourseContextTest do
  use Crudopdracht.DataCase

  alias Crudopdracht.CourseContext

  describe "courses" do
    alias Crudopdracht.CourseContext.Course

    import Crudopdracht.CourseContextFixtures

    @invalid_attrs %{name: nil}

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert CourseContext.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert CourseContext.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Course{} = course} = CourseContext.create_course(valid_attrs)
      assert course.name == "some name"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CourseContext.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Course{} = course} = CourseContext.update_course(course, update_attrs)
      assert course.name == "some updated name"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = CourseContext.update_course(course, @invalid_attrs)
      assert course == CourseContext.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = CourseContext.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> CourseContext.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = CourseContext.change_course(course)
    end
  end
end
