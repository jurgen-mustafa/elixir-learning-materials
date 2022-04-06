defmodule Sum do
  def sum([]) do
    0
  end

  def sum([x | xs]) do
    x + sum(xs)
  end
end
