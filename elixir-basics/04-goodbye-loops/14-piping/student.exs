defmodule Grades do
  def best_students(grades) do
    grades
    |> Enum.sort_by( fn {_,_,x} -> x end , :desc)
    |> Enum.take(3)
    |> Enum.map(fn {_,x,_} -> x end)
  end
end
