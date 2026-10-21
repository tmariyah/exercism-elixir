defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    number
    |> Integer.to_charlist(2) 
    |> to_string() 
    |> String.split("")
    |> Enum.reduce(0, fn x, acc -> if x == "1", do: acc + 1, else: acc end)
  end
end
