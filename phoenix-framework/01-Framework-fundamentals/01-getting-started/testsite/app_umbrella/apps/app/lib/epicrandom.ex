defmodule Epicrandom do
  def random(x) do
    :rand.uniform(x)
    #Enum.random(0..x)
  end
end
