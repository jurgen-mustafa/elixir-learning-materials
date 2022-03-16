defmodule Grades do
  def passed_percentage(grades) do
    round(Enum.count(grades, &(&1 >= 10)) / length(grades)*100)
  end
end
