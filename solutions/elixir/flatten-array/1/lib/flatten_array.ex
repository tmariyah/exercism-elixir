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
  def flatten(list), do: _flatten(list, [])
  
  def _flatten([head | tail], list) when is_list(head) do
    tmp_list = _flatten(head, [])
    _flatten(tail, list ++ tmp_list)
  end

  def _flatten([head | tail], list) when is_nil(head), do: _flatten(tail, list)
  def _flatten([head | tail], list), do: _flatten(tail, list ++ [head])
  def _flatten([], list), do:  list
end
