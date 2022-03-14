defmodule Functions do
  def nest(f,0,x) do
    x
  end
  def nest(f,n,x) do
    nest(f,n-1,f.(x))
  end
end
