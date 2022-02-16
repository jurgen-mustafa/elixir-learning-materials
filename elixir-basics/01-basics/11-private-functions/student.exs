defmodule Math do
    defp factorial(0), do: 1
    defp factorial(x) when x > 0 do
        x * factorial(x-1)
    end
    def binomial(x, y) do
        div(factorial(x), (factorial(y) * factorial(x-y)))
    end
end

