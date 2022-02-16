defmodule Math do
    def range_sum(to, from \\ 0, step \\ 1) do
        if from > to do 
        0 
        else 
        from + range_sum(to, from+step, step)
        end
    end
end