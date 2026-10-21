defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = :math.pow((0 - x), 2) + :math.pow((0 - y), 2)
    cond do
      distance > 100 -> 0
      distance > 25 -> 1
      distance > 1 -> 5
      true -> 10
    end
  end
end
