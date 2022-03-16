defmodule Math do
  def factorial(n) do
    Enum.reduce(1..n,1, &(&1 * &2))
  end
end
