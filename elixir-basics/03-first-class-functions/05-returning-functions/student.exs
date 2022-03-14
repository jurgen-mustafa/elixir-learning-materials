defmodule Shop do
  defp standard(x) do
    x
  end
  defp bronze(x) do
    x*0.95
  end
  defp silver(x) do
    x*0.9
  end
  defp gold(x) do
    x*0.8
  end
  def discount(:standard), do: &standard/1
  def discount(:bronze), do: &bronze/1
  def discount(:silver), do: &silver/1
  def discount(:gold), do: &gold/1
end
