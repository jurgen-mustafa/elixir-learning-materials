defmodule Util do
  def filter([], _), do: []
  def filter([x|xs], predicate) do
    if predicate.(x) == true do
      [x|filter(xs, predicate)]
    else
      filter(xs, predicate)
    end
  end
end
