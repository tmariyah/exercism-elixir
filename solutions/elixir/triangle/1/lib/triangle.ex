defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
  def kind(a, b, c) when a + b >= c and b + c >= a and a + c >= b, do: _kind(a, b, c)
  def kind(_a, _b, _c), do: {:error, "side lengths violate triangle inequality"}

  # Check if trigle is equilateral
  defp _kind(a, b, c) when a === b and b === c and c === a, do: {:ok, :equilateral}

  # Check if trigle is isosceles
  defp _kind(a, b, _c) when a === b, do: {:ok, :isosceles}
  defp _kind(a, _b, c) when a === c, do: {:ok, :isosceles}
  defp _kind(_a, b, c) when b === c, do: {:ok, :isosceles}

  # Check if trigle is scalene
  defp _kind(_a, _b, _c), do: {:ok, :scalene}
end
