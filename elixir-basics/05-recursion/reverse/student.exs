defmodule Exercise do
  def reverse([]) do
    []
  end

  def reverse([x | xs]) do
    reverse(xs) ++ [x]
  end
end
