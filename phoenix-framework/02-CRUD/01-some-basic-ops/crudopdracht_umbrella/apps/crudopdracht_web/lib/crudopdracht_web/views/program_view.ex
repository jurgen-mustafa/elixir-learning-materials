defmodule CrudopdrachtWeb.ProgramView do
  use CrudopdrachtWeb, :view

  # def render_courses_checkboxes(form, field, courses) do
  #   courseList = Enum.map(courses, fn x -> add_course_checkbox(form, field, x) end) |> flatten()

  #   courseList = flatten(courseList)

  #   html_escape(courseList)
  # end

  # defp flatten([x | xs]) when is_list(x), do: flatten(x) ++ flatten(xs)
  # defp flatten([x | xs]), do: [x | flatten(xs)]
  # defp flatten([]), do: []

  # defp add_course_checkbox(form, field, course) do
  #   optslabel =
  #     []
  #     |> Keyword.put_new(:for, input_id(form, field))

  #   opts =
  #     []
  #     |> Keyword.put_new(:type, "checkbox")
  #     |> Keyword.put_new(:id, input_id(form, field))
  #     |> Keyword.put_new(:name, input_name(form, field) <> "[#{course.name}][id]")
  #     |> Keyword.put_new(:value, "#{course.id}")

  #   optshidden =
  #     []
  #     |> Keyword.put_new(:type, "hidden")
  #     |> Keyword.put_new(:value, "-1")
  #     |> Keyword.put_new(:name, input_name(form, field) <> "[#{course.name}][id]")

  #   opts2 =
  #     []
  #     |> Keyword.put_new(:type, "checkbox")
  #     |> Keyword.put_new(:id, input_id(form, field))
  #     |> Keyword.put_new(:name, input_name(form, field) <> "[#{course.name}][bool]")
  #     |> Keyword.put_new(:value, "1")

  #   opts2hidden =
  #     []
  #     |> Keyword.put_new(:type, "hidden")
  #     |> Keyword.put_new(:value, "0")
  #     |> Keyword.put_new(:name, input_name(form, field) <> "[#{course.name}][bool]")

  #   [
  #     content_tag(:label, "#{course.name} & boolean", optslabel),
  #     tag(:input, optshidden),
  #     tag(:input, opts),
  #     tag(:input, opts2hidden),
  #     tag(:input, opts2)
  #   ]
  # end
end
