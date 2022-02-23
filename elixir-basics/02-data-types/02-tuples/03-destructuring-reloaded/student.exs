defmodule Cards do
  defp numericValue(k) when is_number(k), do: k
  defp numericValue(:jack), do: 11
  defp numericValue(:queen), do: 12
  defp numericValue(:king), do: 13
  defp numericValue(:ace), do: 14

  def higher?({v1,s}, {v2,s}, _), do: numericValue(v1) > numericValue(v2)

  #dit werkt maar het is fout, je moet nog checken of de eerste suit niet gelijk is zoals dit:
  #def higher?({_, s2}, {_, s}, s) when s2 != s, do: false
  def higher?(_, {_, s}, s), do: false

  def higher?(_, _ , _), do: true
end
