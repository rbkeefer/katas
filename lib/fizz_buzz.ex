defmodule FizzBuzz do
  def fizz(v1, v2, _v3) when v1 == 0 and v2 == 0, do: "FizzBuzz"
  def fizz(v1, _v2, _v3) when v1 == 0, do: "Fizz"
  def fizz(_v1, v2, _v3) when v2 == 0, do: "Buzz"
  def fizz(_v1, _v2, v3), do: v3

  def buzz(n) do
    fizz(rem(n, 3), rem(n, 5), n)
  end
end
