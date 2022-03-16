defmodule Grades do
  def remove_na(grades) do
    Enum.filter(grades, &(&1 != :na))
  end
end
