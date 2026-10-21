defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(l, l), do: :equal
  def compare(l, []) when length(l) > 0, do: :superlist
  def compare([], l) when length(l) > 0, do: :sublist
  def compare(a, b) when length(a) < length(b) do
    a_length = length(a)

    chunks_of_b = Enum.chunk_every(b, a_length, 1, :discard)
    result = Enum.any?(chunks_of_b, &(&1 === a))
    if result, do: :sublist, else: :unequal
  end

  def compare(a, b) when length(a) > length(b) do
    b_length = length(b)

    chunks_of_a = Enum.chunk_every(a, b_length, 1, :discard)
    result = Enum.any?(chunks_of_a, &(&1 === b))
    if result, do: :superlist, else: :unequal
  end

  def compare(a, b) when length(a) == length(b), do: :unequal
end
