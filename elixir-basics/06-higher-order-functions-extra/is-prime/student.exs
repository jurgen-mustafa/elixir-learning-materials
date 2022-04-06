defmodule Math do
  defp sqareroot(x) do
    if x > 3 do
      trunc(:math.sqrt(x))
    else
      x - 1
    end
  end

  def prime?(n) do
    v = sqareroot(n)

    n == 3 or n == 2 or
      Enum.to_list(2..v)
      |> Enum.all?(fn x -> rem(n, x) != 0 end)
  end
end
