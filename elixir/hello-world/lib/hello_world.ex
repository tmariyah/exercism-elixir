defmodule HelloWorld do
  @doc """
  Simply returns "Hello, World!"
  """
  @spec hello :: String.t()
  def hello do
    IO.inspect "hiiiii"
    "Hello, World!"
  end
end
