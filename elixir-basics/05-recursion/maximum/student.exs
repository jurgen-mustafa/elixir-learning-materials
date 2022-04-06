defmodule Exercise do
  def maximum([x]) do
    x
  end

  def maximum([x, y | xs]) do
    maximum([max(x, y) | xs])
  end
end
