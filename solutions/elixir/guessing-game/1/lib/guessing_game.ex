defmodule GuessingGame do
  def compare(secret_number, guess) when is_integer(secret_number) and is_integer(guess) do
    # Please implement the compare/2 function
    cond do 
      (secret_number + 1) == guess -> "So close"
      (secret_number - 1) == guess -> "So close"
      guess > secret_number -> "Too high"
      guess < secret_number -> "Too low"
      true -> "Correct"
    end
  end

  def compare(_secret_number, guess \\ :no_guess) do 
    "Make a guess"
  end
end
