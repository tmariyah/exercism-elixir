defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    apply_action(input, 0)
  end

  defp apply_action(input, count) when input == 1 do
    count
  end

  defp apply_action(input, count) when rem(input, 2) == 0 and input != 0 do
    apply_action(div(input, 2), count + 1)
  end

  defp apply_action(input, count) when input > 1 and is_integer(input) do
    apply_action((input * 3) + 1, count + 1)
  end
end
