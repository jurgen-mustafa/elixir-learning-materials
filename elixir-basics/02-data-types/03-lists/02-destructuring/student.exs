defmodule Util do
  def first([a|_]) do
    a
  end
  def second([_,b|_]) do
    b
  end
  def third([_,_,c|_]) do
    c
  end
  def last([a]) do
    a
  end
  def last([_|b]) do
    last(b)
  end
  def size([]) do
    0
  end
  def size([_]) do
    1
  end
  def size([_|b]) do
    1 + size(b)
  end
end
