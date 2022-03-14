defmodule Shop do
  def discount(:standard), do: fn x -> x end
  def discount(:bronze), do: fn x -> x*0.95 end
  def discount(:silver), do: fn x -> x*0.9 end
  def discount(:gold), do: fn x -> x*0.8 end
end
