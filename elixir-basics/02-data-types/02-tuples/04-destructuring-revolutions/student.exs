defmodule Math do
  def evaluate(v) when is_number(v), do: v
  def evaluate({o, v1, v2}) when is_tuple(v1), do: evaluate({o, evaluate(v1), v2})
  def evaluate({o, v1, v2}) when is_tuple(v2), do: evaluate({o, v1, evaluate(v2)})

  def evaluate({o, v1, v2}) when is_atom(o) and is_number(v1) and is_number(v2) do
    cond do
      o == :+ -> v1 + v2
      o == :- -> v1 - v2
      o == :* -> v1 * v2
      o == :/ -> v1 / v2
    end
  end
end
