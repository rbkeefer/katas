defmodule Math do
  def sum(n) when n == 0, do: n
  def sum(n) when n > 0, do: sum(n - 1) + n
  def sum(n) when n < 0, do: sum(n + 1) + n

  def gcd(x, y) when x < 0 or y < 0, do: "x and y must be positive"
  def gcd(x, y) when x == 0, do: y
  def gcd(x, y) when y == 0, do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
