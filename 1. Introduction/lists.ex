defmodule Lists do

  # return the n'th element of the list l
  def nth(n, l) do
    [head | tail] = l
    case n do
      1 -> head
      _ -> nth(n-1, tail)
    end
  end

  # return the number of elements in the list l
  def len(l) do
    [head | tail] = l
    case tail do
      [] -> 1
      _ -> 1 + len(tail)
    end
  end

  # return the sum of all elements in the list l, assume that
  #all elements are integers
  def sum(l) do
    [head | tail] = l
    case tail do
      [] -> head
      _ -> head + sum(tail)
    end
  end

  #return a list where all elements are duplicated
  def duplicate(l) do
    [head | tail] = l
    case tail do
      [] -> [head]
      _ -> [head | [head | duplicate(tail)]]
    end
  end

  #add the element x to the list l if it is not in the list
  def add(x, l = [head | tail ]) do
    cond do
      head == x -> l
      tail == [] -> [head | [x]]
      true -> [head | add(x, tail)]
    end
  end

  #return a list of unique elements in the list l, that is [:a,
  #:b, :d] are the unique elements in the list [:a, :b, :a, :d, :a,
  #:b, :b, :a]
  def unique(l) do
    [ head | tail] = l
    cond do
      tail == [] -> head
      end
    end


  #pack(l): return a list containing lists of equal elements, [:a, :a, :b,
  #:c, :b, :a, :c] should return [[:a, :a, :a], [:b, :b], [:c, :c]]
  def pack(l) do

  end

  #return a list where the order of elements is reversed
  def reverse(l) do
    [head | tail] = l
    case tail do
      [] -> [head]
      _ ->  reverse(tail) ++ [head]
    end
  end



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
    queue = front ++ b2
    {:queue, queue}
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
