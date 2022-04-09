defmodule Store do
  def total_cost(prices, basket) do
    basket
    |> Enum.reduce(0, fn x, acc -> acc + Map.get(prices, x) end)
  end
end
