defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  
  def search(numbers, key) do
    size = tuple_size(numbers)

    _search(numbers, key, 0, size - 1)
  end

  defp _search(_numbers, _key, low, high) when low > high, do: :not_found

  defp _search(numbers, key, low, high) do 
      mid = div(low + high, 2)
      cond do
        key == elem(numbers, mid) -> {:ok, mid}
        key > elem(numbers, mid) -> _search(numbers, key, mid + 1, high)
        key < elem(numbers, mid) -> _search(numbers, key, low, mid - 1)
      end
  end
end
