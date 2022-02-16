defmodule Numbers do
    def odd?(t) do
    rem(t, 2) != 0
    end
    def even?(t) do
    rem(t, 2) == 0
    end
end