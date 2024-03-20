defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  My hints:

  In line 20 and 24, you use ++ to concatenate potentially long lists. You should generally avoid that,
  because it is a rather expensive function, which needs to reconstruct the first list completely,
  due to the internal structure of linked lists. With lists you should always try work from the head,
  where you can prepend and access single elements in constant time(O(1)).
  It is very common to accumulate in a tail recursion by prepending single elements
  and in the base case return the accumulator after reversing it

  In line 23 you are testing the head for nil in a guard.
  If you test for concrete values, you don't need a guard
  but can write them directly in the pattern: [nil | tail]

  You have a hard time to flatten the lists by calling flatten a second time in line 19.
  That seems necessary, but breaks the idea of tail-recursing into an accumulator.

  The particular problem in flatten is, that it (not unlike tree-traversal)
  needs a kind of nested tail recursion to work efficiently.

  Let me give you a hint by showing you, how my public function looks:

  def flatten(list),
    do:
      []
      |> accumulate_by_prepending(list)
      |> Enum.reverse()

  defp accumulate_by_prepending(accumulated, element)
  # ... You'll need 4 clauses here

  That is somewhat different from normal (flat) tail-recursion,
  hence the strange function name, the unusual placement of the accumulator
  as first parameter and the reverse in the calling function and not in the tail-recursive function.

  All that allows a very elegant implementation with just 4 clauses (yes, you have also only 4 clauses,
  but the are less elegant and efficient.

  So, you have to write 4 clauses. Two of them are special cases where you don't need to accumulate something
  since element is nil or []. The last clause is any element and is the only one who actually prepends something.
  But how does the first clause look? Can you solve that? Tip:
  Remember, what I said about the accumulation being done nested...
  """

  @spec flatten(list) :: list
  def flatten(list),
    do:
      []
      |> flatten(list)
      |> Enum.reverse()

  defp flatten(list, [head | tail]) when is_list(head) do
    list
    |> flatten(head)
    |> flatten(tail)
  end

  defp flatten(list, [nil | tail]), do: flatten(list, tail)
  defp flatten(list, [head | tail]), do: flatten([head | list], tail)
  defp flatten(list, []), do: list
end
