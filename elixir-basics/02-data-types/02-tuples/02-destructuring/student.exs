defmodule Cards do
  def same_suit?({_, suit}, {_, suit}) do
    true
  end
  def same_suit?(_, _) do
    false
  end
end
