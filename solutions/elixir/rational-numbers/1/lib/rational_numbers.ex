defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {n1, d1} = a
    {n2, d2} = b

    d = trunc lcm(d1, d2)
    numerator = (n1 * trunc(d/d1)) + (n2 * trunc(d/d2))
    denominator = if numerator == 0, do: 1, else: d
      
    {numerator, denominator}
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {n1, d1} = a
    {n2, d2} = b

    d = trunc lcm(d1, d2)
    numerator = (n1 * trunc(d/d1)) - (n2 * trunc(d/d2))
    denominator = if numerator == 0, do: 1, else: d
      
    {numerator, denominator}
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {n1, d1} = a
    {n2, d2} = b

    {numerator, denominator} = {n1 * n2, d1 * d2}
    c_gcd = Kernel.abs(gcd(numerator, denominator))

    {trunc(numerator/c_gcd), trunc(denominator/c_gcd)}
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {n1, d1} = num
    {n2, d2} = den

    {numerator, denominator} = {n1 * d2, d1 * n2}
    c_gcd = gcd(numerator, denominator)

    {trunc(numerator/c_gcd), trunc(denominator/c_gcd)}
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {n, d} = a
    c_gcd = gcd(n, d)

    {Kernel.abs(trunc(n/c_gcd)), Kernel.abs(trunc(d/c_gcd))}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {numerator, denominator} = a

    {numerator, denominator} = 
      if n < 0 do
        {raise_to_power(denominator, Kernel.abs(n)), raise_to_power(numerator, Kernel.abs(n))}
      else
        {raise_to_power(numerator, n), raise_to_power(denominator, n)}
      end
        
    c_gcd = Kernel.abs(gcd(numerator, denominator))

    if denominator < 0 do
      {-trunc(numerator/c_gcd), trunc(Kernel.abs(denominator)/c_gcd)}
    else
      {trunc(numerator/c_gcd), trunc(denominator/c_gcd)}
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {numerator, denominator} = n

    :math.pow(x, numerator/denominator)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {numerator, denominator} = a
    c_gcd = Kernel.abs(gcd(numerator, denominator))

    if denominator < 0 do
      {-trunc(numerator/c_gcd), trunc(Kernel.abs(denominator)/c_gcd)}
    else
      {trunc(numerator/c_gcd), trunc(denominator/c_gcd)}
    end
  end

  defp raise_to_power(number, power) do
    :math.pow(number, power) |> round
  end

  defp gcd(a, 0), do: a
  defp gcd(0, b), do: b
  defp gcd(a, b), do: gcd(b, rem(a,b))

  defp lcm(0, 0), do: 0 
  defp lcm(a, b), do: (a*b)/gcd(a,b)
end
