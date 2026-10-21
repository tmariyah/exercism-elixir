defmodule ResistorColorDuo do

  @resistor_color_value %{
    black: "0",
    brown: "1",
    red: "2",
    orange: "3",
    yellow: "4",
    green: "5",
    blue: "6",
    violet: "7",
    grey: "8",
    white: "9"
  }

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    [color_1, color_2 | _] = colors
    @resistor_color_value[color_1] <> @resistor_color_value[color_2] |> String.to_integer()
  end
end
