defmodule Util do
  def range(a,b) when a > b do
    []
  end
  def range(a,b) when a <= b do
    [a | range(a+1,b)]
  end
end
