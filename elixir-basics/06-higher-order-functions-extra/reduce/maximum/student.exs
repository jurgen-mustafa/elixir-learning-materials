defmodule Util do
  def maximum(xs) do
    Enum.reduce(xs, 0, fn x, acc -> if x > acc, do: x, else: acc end)
  end
end
