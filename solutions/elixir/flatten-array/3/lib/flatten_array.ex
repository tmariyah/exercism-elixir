defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

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
