defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      level == 0 && legacy? == false -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 && legacy? == false -> :fatal
      true -> :unknown
    end
  end
 
  # If the log label is unknown and it comes from a legacy system, 
  # send the alert to the dev1 team, otherwise send it to the dev2 team.
  # If the log label is error or fatal, send the alert to the ops team.
  # All other log labels can be safely ignored.

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    cond do
      level not in [1,2,4,3] && legacy? -> :dev1
      level not in [0,1,2,3,4,5] && legacy? == false -> :dev2
      level in [4, 5] -> :ops
      true -> nil
    end
  end
end
