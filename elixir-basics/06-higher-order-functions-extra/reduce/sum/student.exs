defmodule Math do
  def sum(ns) do
    Enum.reduce(ns, 0, fn x, acc -> x + acc end)
  end
end
