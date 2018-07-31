defmodule ProjectEulerTest do
  use ExUnit.Case

  test "Problem 2: Return sum of even fib numbers" do
    assert 42 = ProjectEuler.sum_even_fib(10)
  end

  test "Problem 1: Return multiples of 3 and 5" do
    assert 23 = ProjectEuler.sum_mult35(10)
    assert 233_168 = ProjectEuler.sum_mult35(1000)
  end
end
