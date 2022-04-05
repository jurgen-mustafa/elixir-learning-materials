defmodule Bank do
  def largest_expense_index(balance_history) do
    balance_history
    |> Enum.zip(Enum.drop(balance_history, 1))
    |> Enum.map(fn {x, y} -> y - x end)
    |> Enum.with_index()
    |> Enum.sort_by(fn {x, _} -> x end)
    |> Enum.map(fn {_, x} -> x end)
    |> Enum.at(0)
  end
end
