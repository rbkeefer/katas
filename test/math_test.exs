defmodule MathTest do
  use ExUnit.Case

  test "Multiplier: Multiply the results of a function over a range" do
    assert 3_628_800 = Math.multiplier(1, 10, & &1)
    assert 1.0 = Float.ceil(Math.multiplier(1, 180, &:math.cos(:math.pi() * &1 / 180.0)))
  end

  test "Summer: Sum the results of a function over a range" do
    assert 55 = Math.summer(1, 10, & &1)
    assert -1.0 = Float.ceil(Math.summer(1, 180, &:math.cos(:math.pi() * &1 / 180.0)))
  end

  test "Sum up to given value" do
    assert 3 = Math.sum_up(2)
    assert 15 = Math.sum_up(5)
    assert -15 = Math.sum_up(-5)
  end

  test "Sum all values in a given list" do
    assert 6 = Math.sum_list([1, 2, 3])
    assert 15 = Math.sum_list([1, 2, 3, 4, 5])
    assert 65 = Math.sum_list([11, 12, 13, 14, 15])
  end

  test "mapsum" do
    assert 12 = Math.mapsum([1, 2, 3], &(&1 + &1))
    assert 14 = Math.mapsum([1, 2, 3], &(&1 * &1))
    assert 55 = Math.mapsum([1, 2, 3, 4, 5], &(&1 * &1))
    assert 0 = Math.mapsum([11, 12, 13, 14, 15], &(&1 - &1))
  end

  test "max list" do
    assert 3 = Math.max([1, 2, 3])
    assert 100 = Math.max([100, 20, 3])
    assert 20 = Math.max([10, 20, 3])
    assert 0 = Math.max([0, -20, -3])
    assert -3 = Math.max([-100, -20, -3])
  end

  test "generate span list" do
    assert [0, 1, 2, 3] = Math.span(0, 3)
    assert [10, 11, 12, 13] = Math.span(10, 13)
    assert [-10, -9, -8, -7, -6, -5] = Math.span(-10, -5)
  end

  test "greatest common divisor" do
    assert "x and y must be positive" = Math.gcd(-1, 1)
    assert "x and y must be positive" = Math.gcd(1, -1)

    assert 0 = Math.gcd(0, 0)
    assert 1 = Math.gcd(0, 1)
    assert 1 = Math.gcd(1, 0)
    assert 7 = Math.gcd(21, 35)
    assert 7 = Math.gcd(35, 21)
    assert 21 = Math.gcd(21, 42)
    assert 21 = Math.gcd(42, 21)
  end

  test "return a list of prime numbers from 2 to n" do
    assert [2, 3, 5, 7] = Math.prime_numbers(10)
    assert [2, 3, 5, 7, 11, 13, 17, 19] = Math.prime_numbers(20)
  end
end
