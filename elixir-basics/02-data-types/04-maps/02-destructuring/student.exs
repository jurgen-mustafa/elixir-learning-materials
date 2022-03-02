defmodule Util do
  def follow(map, start) do
    v = Map.get(map, start)
    if v do
      [start | follow(map, v)]
    else
      [start]
    end
  end
end
