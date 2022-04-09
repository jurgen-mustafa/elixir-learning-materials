defmodule Math do
  def product(ns) do
    Enum.reduce(ns, 1, fn x, acc -> x * acc end)
  end
end
