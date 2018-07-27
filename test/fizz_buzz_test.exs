defmodule FizzBuzzTest do
  use ExUnit.Case

  test "returns FizzBuzz" do
    assert "FizzBuzz" = FizzBuzz.fizz(0, 0, 100)
    assert "Fizz" = FizzBuzz.fizz(0, 1, 100)
    assert "Buzz" = FizzBuzz.fizz(1, 0, 100)
    assert 100 = FizzBuzz.fizz(1, 1, 100)

    assert "Buzz" = FizzBuzz.buzz(10)
    assert 11 = FizzBuzz.buzz(11)
    assert "Fizz" = FizzBuzz.buzz(12)
    assert 13 = FizzBuzz.buzz(13)
    assert 14 = FizzBuzz.buzz(14)
    assert "FizzBuzz" = FizzBuzz.buzz(15)
    assert 16 = FizzBuzz.buzz(16)
  end
end
