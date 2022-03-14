defmodule Functions do
  def compose([],x) do
    x
  end
  def compose([f|fs],x) do
    compose(fs,f.(x))
  end
end
