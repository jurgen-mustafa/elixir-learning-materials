defmodule Math do
  def sqrt(x) do
    Functions.fixedpoint( &(&1 - (&1 * &1 - x) / (x * 2)), x)
  end
end
