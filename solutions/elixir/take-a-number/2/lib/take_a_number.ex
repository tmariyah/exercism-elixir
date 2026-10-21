defmodule TakeANumber do
  def start() do
    spawn_link(fn -> listen(0) end)
  end

  defp listen(number) do
    receive do
      {:report_state, from_pid} -> 
        send(from_pid, number)
        listen(number)

      {:take_a_number, from_pid} -> 
        new_number = number + 1
        send(from_pid, new_number)
        listen(new_number) 

      :stop ->
        :kill

      _ -> 
        listen(number)
    end
  end
end
