defmodule Util do
  def count([], predicate) do
    0
  end
  def count([x|xs], predicate) do
    if predicate.(x) == true do
      1 + count(xs, predicate)
    else
      count(xs, predicate)
    end
  end
end
