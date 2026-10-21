defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = :math.pow((0 - x), 2) + :math.pow((0 - y), 2)
    cond do
      distance >= 0 and distance <= 1 -> 10
      distance <= 25 -> 5
      distance <= 100 -> 1
      true -> 0
    end
  end
end
