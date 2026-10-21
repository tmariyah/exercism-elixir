defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
   def compare(a, b) do
    cond do
      a === b -> :equal    
      superlist?(b, a) -> :sublist
      superlist?(a, b) -> :superlist      
      true -> :unequal
    end
  end

  defp superlist?(a, b) when length(a) < length(b), do: false
  defp superlist?(a, b) do
    chunk = Enum.take(a, length(b))
    (chunk === b) or superlist?(tl(a), b)
  end
end
