defmodule ProjectEulerTest do
  use ExUnit.Case

  test "Problem 8: Largest value in series" do
    assert 5832 == ProjectEuler.largest_in_series(4)
    assert 23_514_624_000 == ProjectEuler.largest_in_series(13)
  end

  test "Problem 7: Calculate the nth prime number" do
    assert true == ProjectEuler.is_prime?(5, 2, 104_743)
    assert 104_743 = ProjectEuler.nth_prime_number(10001)
  end

  test "Problem 6: Difference of sum of squares and square of sums" do
    assert 2640 = ProjectEuler.square_difference(10)
    assert 25_164_150 = ProjectEuler.square_difference(100)
  end

  test "Problem 5: Smallest positive number divisible by 1 to 20" do
    assert 232_792_560 = ProjectEuler.smallest_divisible()
  end

  test "Problem 4: Return largest palindrome" do
    assert 906_609 = ProjectEuler.largest_palindrome(999)
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
    assert 78 = ProjectEuler.sum_mult35(20)
    assert 233_168 = ProjectEuler.sum_mult35(1000)
  end
end
