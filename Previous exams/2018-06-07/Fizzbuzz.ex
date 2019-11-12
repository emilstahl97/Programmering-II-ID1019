defmodule Fizzbuzz do

def f(n) do fizzbuzz(1, n+1, 1, 1) end

def fizzbuzz(n, n, _, _) do [] end
def fizzbuzz(i, n, 3, 5) do [:fizzbuzz | fizzbuzz(i+1, n, 1,1)] end
def fizzbuzz(i, n, 3, b) do [:fizz | fizzbuzz(i+1, n, 1, b+1)] end
def fizzbuzz(i, n, f, 5) do [:buzz | fizzbuzz(i+1, n, f+1, 1)] end
def fizzbuzz(i, n, f, b) do [i | fizzbuzz(i+1, n, f+1, b+1)] end

end
