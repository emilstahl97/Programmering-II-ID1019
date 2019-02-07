defmodule Introduction do
#------------------
# 2. A first program
#------------------
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

#-----------------------
# 3. Recursive functions
#-----------------------

  # Calculate the product of m and n
  def product(m, n) do
    case m do
      0 -> 0
      _ -> n + product(m-1, n)
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

#-----------------------
# 4. List Operations
#-----------------------

    def append([], y) do y end
    def append([h|t], y) do
      z = append(t,z)
      [h | z]
    end

    # return the n'th element of the list l
  def nth(n, [head | tail]) do
    case n do
      0 -> head
      _ -> nth(n-1, tail)
    end
  end

  # return the number of elements in the list l
  def len([]) do 0 end
  def len([_head | tail]) do 1 + len(tail) end

  # return the sum of all elements in the list l, assume that
  #all elements are integers
  def sum([]) do 0 end
  def sum([head | tail]) do head + sum(tail) end

  #return a list where all elements are duplicated
  def duplicate([]) do [] end
  def duplicate([head | tail]) do [head | [head | duplicate(tail)]] end

  #add the element x to the list l if it is not in the list
  def add(x, []) do [x] end
  def add(x, list = [head | tail])
  do
    cond do
      head == x -> list
      tail == [] -> [head | [x]]
      true -> [head | add(x, tail)]
    end
  end


  # remove all occurrences of x in l

  def remove( _ , []) do [] end
  def remove(x, [head | tail]) do
    cond do
      head == x -> remove(x, tail)
      true -> [head | remove(x, tail)]
    end
  end


  #return a list of unique elements in the list l, that is [:a,
  #:b, :d] are the unique elements in the list [:a, :b, :a, :d, :a,
  #:b, :b, :a]

  # Function that return true if element is present in list
  # false if otherwise
  def contains(element, list) do
    case list do
      [] -> false
      [head | _tail] when element == head -> true
      [_head | tail] -> contains(element, tail);
    end
  end

  # Start with an empty list for the unique elements
  def unique(list) do unique(list, []) end

  # If we have reached the end of the list, return our lists
  # of unique elements
  def unique([], unique_list) do unique_list end

  # Check if the the next element is present in our unique list
  # If present -> move on
  # If not present -> add to unique list and move on
  def unique([head | tail], unique_list) do
    case contains(head, unique_list) do
      true -> unique(tail, unique_list)
      false -> unique(tail, unique_list ++ [head])
    end
  end

  #pack(l): return a list containing lists of equal elements, [:a, :a, :b,
  #:c, :b, :a, :c] should return [[:a, :a, :a], [:b, :b], [:c, :c]]
  def pack(_list) do

  end

  #return a list where the order of elements is reversed
  def reverseList([]) do [] end
  def reverseList([head | tail]) do reverse(tail) ++ [head] end

#-----------------------
# 4.1 Sorting
#-----------------------

#-----------------------
# 4.2 Insertion sort
#-----------------------

  #Start by defning a function insert(element, list),
  #that inserts the element at the right place in the list.
  def insert(element, list) do
    case list do
      [] -> [element]
      [head | tail] when head >= element -> [element | [ head | tail]]
      [head | tail] -> [head | insert(element, tail)]
    end
  end

  # Take first element and sort it
  def isort(_list = [head | tail]) do
    isort([head], tail)
  end

  # If all elements have been checked, return the sorted list
  def isort(sorted_list, unsorted_list) do
    case unsorted_list do
      [] -> sorted_list
      [head | tail] -> insert(head, sorted_list) |> isort(tail)
    end
  end

#-----------------------
# 4.3 Merge sort
#-----------------------

  def msort([ head | [] ]) do [head] end
  def msort(list) do
    {list1, list2} = msplit(list, [], [])
    merge(msort(list1),msort(list2))
  end

  # Megre two sublists
  def merge(list1, []) do list1 end
  def merge([], list2) do list2 end
  def merge(list1 = [head1 | tail1], list2 = [head2 | tail2]) do
    cond do
      head1 < head2 -> [head1 | merge(tail1, list2)]
      true -> [head2 | merge(list1, tail2)]
    end
  end

  # Split list into two sublists until original list is empty
  def msplit([],list1, list2) do
    {list1, list2}
  end
  def msplit([head | tail],list1, list2) do
    msplit(tail, [head | list2], list1)
  end

#-----------------------
# 4.4 Quicksort
#-----------------------

  # low = sublist of elements smaller than pivot
  # high = sublist of elements larger than pivot
  def qsort([]) do [] end
  def qsort([pivot | list]) do
    {low , high} = qsplit(pivot, list, [], [])
    qappend(low, [pivot | high])
  end

  # Use the pivot and decide where to put the head of
  # the original list
  def qsplit(_, [], small, large) do {small, large} end
  def qsplit(pivot, [head | tail], small, large) do
    if head < pivot do
      qsplit(pivot, tail, [head | small], large)
    else
      qsplit(pivot, tail, small, [head | large])
    end
  end

  # Append the list with the sorted left sublist and the sorted
  # right sublist
  def qappend(small, []) do small end
  def qappend(small, [h | t]) do qsort(small) ++ [h] ++ qsort(t) end

#-----------------------
# Performance analysis
#-----------------------
  def bench() do
    ls = [16, 32, 64, 128, 256, 512]
    n = 100
    # bench is a closure: a function with an environment.
    bench = fn(l) ->
      seq = Enum.to_list(1..l)
      tn = time(n, fn -> nreverse(seq) end)
      tr = time(n, fn -> reverse(seq) end)
      :io.format("length: ~10w nrev: ~8w us rev: ~8w us~n", [l, tn, tr])
    end
    # We use the library function Enum.each that will call
    # bench(l) for each element l in ls
    Enum.each(ls, bench)
  end

  # Time the execution time of the a function.
  def time(n, fun) do
    start = System.monotonic_time(:milliseconds)
    loop(n, fun)
    stop = System.monotonic_time(:milliseconds)
    stop - start
  end

  # Apply the function n times.
  def loop(n, fun) do
    if n == 0 do
      :ok
    else
      fun.()
      loop(n - 1, fun)
    end
  end

#-----------------------
# 5. Reverse
#-----------------------

  def nreverse([]) do [] end
  def nreverse([head | tail]) do
    reversed = nreverse(tail)
    [head] ++ reversed
  end

  # Initialize reverse function
  def reverse(list) do reverseFast(list, []) end

  # Reverse the list
  def reverseFast([], reversed) do reversed end
  def reverseFast([head | tail], reversed) do
    reverseFast(tail, [head | reversed])
  end

#-----------------------
# 6. More challenges
#-----------------------

#-----------------------
# 6.1 Integer to binary
#-----------------------


end
