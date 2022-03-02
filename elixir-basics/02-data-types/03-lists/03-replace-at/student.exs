defmodule Util do
  def replace_at([_|b],0,x) do
    [x|b]
  end
  def replace_at([a|b],i,x) when i > 0 do
    [a|replace_at(b,i-1,x)]
  end
end
