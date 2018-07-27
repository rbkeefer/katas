defmodule MathTest do
  use ExUnit.Case

  test "Summer" do
    assert 3 = Math.sum(2)
    assert 15 = Math.sum(5)
    assert -15 = Math.sum(-5)
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
end
