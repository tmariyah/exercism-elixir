defmodule ResistorColorTrio do

  @color_value %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    IO.inspect colors
    [first, second, third] =
      colors
      |> Enum.map(&@color_value[&1])
      |> IO.inspect
      |> Enum.take(3)

    [first, second, append_0(third)]
    |> Enum.join("")
    |> String.to_integer()
    |> in_kiloohms()
  end

  defp in_kiloohms(resistance) do
    if resistance > 999 do
      {trunc(resistance/1000), :kiloohms}
    else
      {resistance, :ohms}
    end
  end

  defp append_0(0), do: ""
  defp append_0(value), do: String.duplicate("0", value)
end
