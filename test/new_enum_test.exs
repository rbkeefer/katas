defmodule NewEnumTest do
  use ExUnit.Case
  require Integer

  test "all? checks for truth on each element" do
    assert false == NewEnum.all?([1, 2, 3, 4, 5], &(&1 > 4))
  end

  test "apply function to each element in list" do
    assert [2, 4, 6, 8, 10] == NewEnum.each([1, 2, 3, 4, 5], &(&1 + &1))
  end

  test "filter list with function" do
    assert [2, 4] == NewEnum.filter([1, 2, 3, 4, 5], &Integer.is_even/1)
    assert [] == NewEnum.filter([1, 3, 5], &Integer.is_even/1)
  end

  test "split list into smaller lists" do
    assert {[1, 2], [3]} == NewEnum.split([1, 2, 3], 2)
    assert {[1, 2, 3], []} == NewEnum.split([1, 2, 3], 10)
    assert {[], [1, 2, 3]} == NewEnum.split([1, 2, 3], 0)
  end

  test "take first n items from list" do
    assert [1, 2] == NewEnum.take([1, 2, 3], 2)
    assert [1, 2, 3] == NewEnum.take([1, 2, 3], 10)
    assert [] == NewEnum.take([1, 2, 3], 0)
  end
end
