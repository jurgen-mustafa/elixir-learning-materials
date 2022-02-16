defmodule Numbers do
    def abs(x) when is_number(x) and x >= 0, do: x
    def abs(x) when is_number(x) and x < 0, do: -x
end