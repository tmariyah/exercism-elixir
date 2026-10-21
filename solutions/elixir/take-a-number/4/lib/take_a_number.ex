defmodule TakeANumber do
  def start() do
    spawn_link(fn -> loop(0) end)
  end

  defp loop(number) do
    receive do
      {:report_state, from_pid} -> 
        send(from_pid, number)
        loop(number)

      {:take_a_number, from_pid} -> 
        new_number = number + 1
        send(from_pid, new_number)
        loop(new_number) 

      :stop ->
        nil

      _ -> 
        loop(number)
    end
  end
end
