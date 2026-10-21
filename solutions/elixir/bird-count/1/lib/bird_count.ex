defmodule BirdCount do
  def today([head | tail]) do
    # Please implement the today/1 function
    head
  end

  def today([]) do
    # Please implement the today/1 function
    nil
  end

  def increment_day_count([head | tail]) do
    # Please implement the increment_day_count/1 function
    [head + 1 | tail]
  end

  def increment_day_count([]) do
    # Please implement the increment_day_count/1 function
    [1]
  end

  def has_day_without_birds?(list) do
    # Please implement the has_day_without_birds?/1 function
    day_without_birds_count(list)
  end

  defp day_without_birds_count([]), do: false
  defp day_without_birds_count([0 | _tail]), do: true
  defp day_without_birds_count([_head | tail]), do: day_without_birds_count(tail)

  def total(list) do
    # Please implement the total/1 function
    total_count(list, 0)
  end

  defp total_count([], count), do: count
  defp total_count([head | tail], count) do
    total_count(tail, count + head)
  end

  def busy_days(list) do
    # Please implement the busy_days/1 function
    busy_days_count(list, 0)
  end

  def busy_days_count([], count), do: count
  def busy_days_count([head | tail], count) when head > 4 do
    busy_days_count(tail, count + 1)
  end
  def busy_days_count([head | tail], count) when head < 5 do
    busy_days_count(tail, count)
  end
end
