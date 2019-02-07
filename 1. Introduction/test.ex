defmodule Test do

  # Compute the double of a number
  def double(n) do
    2*n
  end

  #a function that converts from Fahrenheit to Celsius (the function is as
  #follows: C = (F − 32)/1.8)
  def toCelsius(f) do
    (f - 32)/1.8
  end

  #a function that calculates the area of a rectangle give the length of the
  #two sides
  def areaRec(b, h) do
    b * h
  end

  #a function that calculates the area of a square, using the previous
  #function
  def areaSq(x) do
    areaRec(x, x)
  end

  #a function that calculates the area of a circle given the radius
  def areaCirc(r) do
    :math.pi * :math.pow(r, 2)
  end

  # Recursive functions

  # Calculate the product of m and n
  def product(m, n) do
    if m == 0 do
      0
    else
      n + product(m-1, n)
    end
  end

  # Calculate x raised to the nth power
  def exp(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> product(x, exp(x, n-1))
    end
  end

  # Calculate x raised to the nth power, but faster
  def expFast(x, n) do
    cond do
      n == 1 -> x
      rem(n, 2) == 0 -> expFast(x, div(n,2)) * expFast(x, div(n,2))
      true -> expFast(x, n-1) * x
    end
  end
end
