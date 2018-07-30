defmodule ProjectEuler do
  @doc """
    Problem 1: https://projecteuler.net/problem=1
    If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
    Find the sum of all the multiples of 3 or 5 below 1000.
  """
  def sum_mult35(arg) do
    _sum_mult35(0, arg, 0)
  end

  def _sum_mult35(current_value, max_value, sum_value)
      when current_value == max_value,
      do: sum_value

  def _sum_mult35(current_value, max_value, sum_value)
      when rem(current_value, 3) == 0,
      do: _sum_mult35(current_value + 1, max_value, sum_value + current_value)

  def _sum_mult35(current_value, max_value, sum_value)
      when rem(current_value, 5) == 0,
      do: _sum_mult35(current_value + 1, max_value, sum_value + current_value)

  def _sum_mult35(current_value, max_value, sum_value),
    do: _sum_mult35(current_value + 1, max_value, sum_value)
end
