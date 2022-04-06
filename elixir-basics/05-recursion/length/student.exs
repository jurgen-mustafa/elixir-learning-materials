defmodule Exercise do
  def len([]) do
    0
  end

  def len([_ | x]) do
    1 + len(x)
  end
end
