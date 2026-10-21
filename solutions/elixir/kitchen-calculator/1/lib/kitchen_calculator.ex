defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    # Please implement the get_volume/1 function
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter(volume_pair) do
    # Please implement the to_milliliter/1 functions
    _to_milliliter(volume_pair)
  end

  def from_milliliter(volume_pair, unit) do
    # Please implement the from_milliliter/2 functions
    {_, volume} = volume_pair
    {unit, _from_milliliter({unit, volume})}
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end

  defp _to_milliliter({:cup, volume}), do: {:milliliter, 240.0 * volume}
  defp _to_milliliter({:fluid_ounce, volume}), do: {:milliliter, 30.0 * volume}
  defp _to_milliliter({:teaspoon, volume}), do: {:milliliter, 5.0 * volume}
  defp _to_milliliter({:tablespoon, volume}), do: {:milliliter, 15.0 * volume}
  defp _to_milliliter({:milliliter, volume}), do: {:milliliter, volume}

  defp _from_milliliter({:cup, volume}), do: volume/240
  defp _from_milliliter({:fluid_ounce, volume}), do: volume/30
  defp _from_milliliter({:teaspoon, volume}), do: volume/5
  defp _from_milliliter({:tablespoon, volume}), do: volume/15
  defp _from_milliliter({:milliliter, volume}), do: volume
end
