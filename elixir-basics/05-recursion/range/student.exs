defmodule Exercise do
  def range(x, y) when x >= y do
    []
  end

  def range(x, y) do
    [x] ++ range(x + 1, y)
  end
end
