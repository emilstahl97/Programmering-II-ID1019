defmodule Lists do

def nth_l(1, [r|_]) do r end
def nth_l(2, [_,r|_]) do r end

def nth_t(1, {r,_,_}) do r end

#Return the n:th element of a list

def nth(1, [r|_]) do r end
def nth(n, [_|t]) do nth(n-1, t) end

def reverse([]) do [] end
def reverse([head | tail]) do reverse(tail) ++ [head] end


#Implementing a standard FIFO Queue

#Call add function with one array and split it into two

def add({:queue, list}, elem) do

  len = length(list)/2 |> round

  [a, b] = Enum.chunk(list, len)
  add({:queue, a, b}, elem)
end

def add({:queue, front, back}, elem) do
  b = reverse(back)
  b2 = reverse([elem|b])
  {:queue, front, b2}
end

def remove({:queue, list}) do

  len = length(list)/2 |> round

  [a, b] = Enum.chunk(list, len)
  remove({:queue, a, b})
end

def remove({:queue, [elem|rest], back}) do
  {:ok, elem, {:queue, rest, back}}
end

def remove({:queue, [], back}) do
  case back do
    [] -> :fail
    [elem|rest] -> {:ok, elem, {:queue, rest, []}}
end
end

end
