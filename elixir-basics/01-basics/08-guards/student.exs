defmodule Numbers do
    def odd?(x) when is_number(x) do
        rem(x, 2) != 0
    end
    def even?(x) when is_number(x) do
        rem(x,2) == 0
    end
end