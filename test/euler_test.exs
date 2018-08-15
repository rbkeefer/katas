defmodule ProjectEulerTest do
  use ExUnit.Case

  test "Problem 4: Return largest palindrome" do
    assert 9009 = ProjectEuler.largest_palindrome(99)
    assert 90909 = ProjectEuler.largest_palindrome(999)
  end

  test "Problem 3: Return largest prime factor" do
    assert [2, 5] = ProjectEuler.prime_factors(10)
    assert [5, 7, 13, 29] = ProjectEuler.prime_factors(13195)
    assert [71, 839, 1471, 6857] = ProjectEuler.prime_factors(600_851_475_143)
  end

  test "Problem 2: Return sum of even fib numbers" do
    assert 10 = ProjectEuler.sum_even_fib_nums(1, 2, 10, 0)
    assert 44 = ProjectEuler.sum_even_fib_nums(1, 2, 40, 0)
    assert 4_613_732 = ProjectEuler.sum_even_fib_nums(1, 2, 4_000_000, 0)
  end

  test "Problem 1: Return multiples of 3 and 5" do
    assert 23 = ProjectEuler.sum_mult35(10)
    assert 233_168 = ProjectEuler.sum_mult35(1000)
  end
end
