defmodule Grades do
  def any_tolerable?(grades) do
    Enum.any?(grades, fn x -> x == 8 or x == 9 end)
  end
end
