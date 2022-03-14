defmodule Shop do
  defp create_discounter(p), do: &(&1 * p)
  def discount(:standard), do: create_discounter(1)
  def discount(:bronze), do: create_discounter(0.95)
  def discount(:silver), do: create_discounter(0.9)
  def discount(:gold), do: create_discounter(0.8)
end
