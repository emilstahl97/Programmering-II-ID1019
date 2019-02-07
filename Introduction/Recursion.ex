defmodule Recursion do

  def append([], y) do y end
  def append([h|t], y) do
    z = append(t,y)
    [h | z]
  end


def union([], y) do y end
def union([h|t], y) do
  z = union(t, y)
  [h|z]
end

def tailr([], y) do y end
def tailr([h|t], y) do
z = [h|y]
  tailr(t,z)
end

def rev([]) do [] end
def rev([h|t]) do
  rev(t)++[h]
end




end
