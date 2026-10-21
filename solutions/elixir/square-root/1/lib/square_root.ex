defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer

  Repeated Subtraction Method of Square Root.
  subtract the consecutive odd numbers from the number for which we are finding the square root, till we reach 0. The number of times we subtract is the square root of the given number. e.g., square_root of 16 is 4
  16 - 1 = 15
  15 - 3 =12
  12 - 5 = 7
  7- 7 = 0
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    _calculate(radicand, 1, 0)
  end

  def _calculate(radicand, odd_no, count) do
    if radicand == 0 do
      count
    else
      _calculate(radicand - odd_no, odd_no + 2, count + 1)
    end
  end
end
