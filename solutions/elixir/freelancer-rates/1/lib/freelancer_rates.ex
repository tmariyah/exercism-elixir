defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount - (discount/100 * before_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    22.0 * daily_rate(hourly_rate)
    |> apply_discount(discount) 
    |> Float.ceil(0) 
    |> round()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    days = budget / apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(days, 1)
  end
end
