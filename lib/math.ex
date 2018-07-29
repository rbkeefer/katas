defmodule Math do
  def sum_up(n) when n == 0, do: n
  def sum_up(n) when n > 0, do: sum_up(n - 1) + n
  def sum_up(n) when n < 0, do: sum_up(n + 1) + n

  def sum_list([]), do: 0
  def sum_list([head | tail]), do: sum_list(tail) + head

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: mapsum(tail, func) + func.(head)

  def gcd(x, y) when x < 0 or y < 0, do: "x and y must be positive"
  def gcd(x, y) when x == 0, do: y
  def gcd(x, y) when y == 0, do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  def max(list), do: _max(list, -100_000_000_000)
  def _max([], bigno), do: bigno
  def _max([head | tail], bigno) when bigno > head, do: _max(tail, bigno)
  def _max([head | tail], _bigno), do: _max(tail, head)

  def span(from, to) when to < from, do: "to must be greater than from"
  def span(from, to) when from == to, do: [to]
  def span(from, to), do: [from | span(from + 1, to)]
end
