defmodule Functions do
  def fixedpoint(f,x) do
    if f.(x) == x do
      x
    else
      fixedpoint(f, f.(x))
    end
  end
end
