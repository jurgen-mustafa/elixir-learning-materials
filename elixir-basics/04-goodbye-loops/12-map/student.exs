defmodule Grades do
  defp transform(x) when x <= 7, do: "C"
  defp transform(x) when x > 7 and x < 10, do: "B"
  defp transform(x) when x >= 10, do: "A"
  def to_code(grades) do
    Enum.join(Enum.map(grades, &transform/1))
  end
end
