defmodule Fibonacci do
    def fib(0), do: 0
    def fib(1), do: 1
    def fib(x) when is_number(x) and x >= 2 do
        fib(x-1) + fib(x-2)
    end
end