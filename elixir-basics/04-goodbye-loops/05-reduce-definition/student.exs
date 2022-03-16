defmodule Util do
  def reduce([], init, _) do
    init
  end
  def reduce([x|xs], init, f) do
    res = f.(x,init)
    reduce(xs, res, f)
  end
end
