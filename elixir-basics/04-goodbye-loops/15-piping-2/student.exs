defmodule Grades do
  def ranking(grades) do
    grades
    |> Enum.filter(fn {_,_,x} -> x >= 10 end)
    |> Enum.sort_by(fn {_,_,x} -> x end, :desc)
    |> Enum.with_index(1)
    |> Enum.map(fn {{_,x,_},i} -> "#{i}. #{x}" end)
    |> Enum.join("\n")
  end
end
