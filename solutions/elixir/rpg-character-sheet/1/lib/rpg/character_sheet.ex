defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts "Welcome! Let's fill out your character sheet together."
  end

  def ask_name() do
    prompt("What is your character's name?\n")
  end

  def ask_class() do
    prompt("What is your character's class?\n")
  end

  def ask_level() do
    prompt("What is your character's level?\n") |> String.to_integer()
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    IO.inspect(%{
      name: name,
      class: class,
      level: level
    }, label: "Your character")
  end

  defp prompt(question) do
    question
    |> IO.gets()
    |> String.trim()
  end
end
