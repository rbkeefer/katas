defmodule SearchKatasTest do
  use ExUnit.Case
  # doctest SearchKatas

  test "search finds nothing in empty list" do
    assert :notfound == SearchKatas.just_use_in(3, [])
    assert :notfound == SearchKatas.lin_search(3, [])
    assert :notfound == SearchKatas.bin_search(3, [])
    assert :notfound == SearchKatas.jmp_search(3, [])
    assert :notfound == SearchKatas.interpolation_search(3, [])
  end

  test "search finds nothing in list of one" do
    assert :notfound == SearchKatas.just_use_in(3, [1])
    assert :notfound == SearchKatas.lin_search(3, [1])
    assert :notfound == SearchKatas.bin_search(3, [1])
    assert :notfound == SearchKatas.jmp_search(3, [1])
    assert :notfound == SearchKatas.interpolation_search(3, [1])
  end

  test "search finds match in list of one" do
    assert 1 == SearchKatas.just_use_in(1, [1])
    assert 1 == SearchKatas.lin_search(1, [1])
    assert 1 == SearchKatas.bin_search(1, [1])
    assert 1 == SearchKatas.jmp_search(1, [1])
    assert 1 == SearchKatas.interpolation_search(1, [1])
  end

  test "search matches on first value in list of three" do
    assert 1 == SearchKatas.just_use_in(1, [1, 3, 5])
    assert 1 == SearchKatas.lin_search(1, [1, 3, 5])
    assert 1 == SearchKatas.bin_search(1, [1, 3, 5])
    assert 1 == SearchKatas.jmp_search(1, [1, 3, 5])
    assert 1 == SearchKatas.interpolation_search(1, [1, 3, 5])
  end

  test "search matches on middle value in list of three" do
    assert 3 == SearchKatas.just_use_in(3, [1, 3, 5])
    assert 3 == SearchKatas.lin_search(3, [1, 3, 5])
    assert 3 == SearchKatas.bin_search(3, [1, 3, 5])
    assert 3 == SearchKatas.jmp_search(3, [1, 3, 5])
    assert 3 == SearchKatas.interpolation_search(3, [1, 3, 5])
  end

  test "search matches on last value in list of three" do
    assert 5 == SearchKatas.just_use_in(5, [1, 3, 5])
    assert 5 == SearchKatas.lin_search(5, [1, 3, 5])
    assert 5 == SearchKatas.bin_search(5, [1, 3, 5])
    assert 5 == SearchKatas.jmp_search(5, [1, 3, 5])
    assert 5 == SearchKatas.interpolation_search(5, [1, 3, 5])
  end

  test "search matches on first value in list of four" do
    assert 1 == SearchKatas.just_use_in(1, [1, 3, 5, 7])
    assert 1 == SearchKatas.lin_search(1, [1, 3, 5, 7])
    assert 1 == SearchKatas.bin_search(1, [1, 3, 5, 7])
    assert 1 == SearchKatas.jmp_search(1, [1, 3, 5, 7])
    assert 1 == SearchKatas.interpolation_search(1, [1, 3, 5, 7])
  end

  test "search matches on middle value in list of four" do
    assert 3 == SearchKatas.just_use_in(3, [1, 3, 5, 7])
    assert 3 == SearchKatas.lin_search(3, [1, 3, 5, 7])
    assert 3 == SearchKatas.bin_search(3, [1, 3, 5, 7])
    assert 3 == SearchKatas.jmp_search(3, [1, 3, 5, 7])
    assert 3 == SearchKatas.interpolation_search(3, [1, 3, 5, 7])
  end

  test "search matches on middle value in long list" do
    assert 55 ==
             SearchKatas.just_use_in(55, [
               0,
               1,
               1,
               2,
               3,
               5,
               8,
               13,
               21,
               34,
               55,
               89,
               144,
               233,
               377,
               610
             ])

    assert 55 ==
             SearchKatas.lin_search(55, [
               0,
               1,
               1,
               2,
               3,
               5,
               8,
               13,
               21,
               34,
               55,
               89,
               144,
               233,
               377,
               610
             ])

    assert 55 ==
             SearchKatas.bin_search(55, [
               0,
               1,
               1,
               2,
               3,
               5,
               8,
               13,
               21,
               34,
               55,
               89,
               144,
               233,
               377,
               610
             ])

    assert 55 ==
             SearchKatas.jmp_search(55, [
               0,
               1,
               1,
               2,
               3,
               5,
               8,
               13,
               21,
               34,
               55,
               89,
               144,
               233,
               377,
               610
             ])

    assert 55 ==
             SearchKatas.interpolation_search(55, [
               0,
               1,
               1,
               2,
               3,
               5,
               8,
               13,
               21,
               34,
               55,
               89,
               144,
               233,
               377,
               610
             ])
  end

  test "search matches on last value in list of four" do
    assert 7 == SearchKatas.just_use_in(7, [1, 3, 5, 7])
    assert 7 == SearchKatas.lin_search(7, [1, 3, 5, 7])
    assert 7 == SearchKatas.bin_search(7, [1, 3, 5, 7])
    assert 7 == SearchKatas.jmp_search(7, [1, 3, 5, 7])
    assert 7 == SearchKatas.interpolation_search(7, [1, 3, 5, 7])
  end

  test "search does not match on non-existent numbers, even at edges" do
    assert :notfound == SearchKatas.just_use_in(0, [1, 3, 5])
    assert :notfound == SearchKatas.just_use_in(2, [1, 3, 5])
    assert :notfound == SearchKatas.just_use_in(4, [1, 3, 5])
    assert :notfound == SearchKatas.just_use_in(6, [1, 3, 5])

    assert :notfound == SearchKatas.lin_search(0, [1, 3, 5])
    assert :notfound == SearchKatas.lin_search(2, [1, 3, 5])
    assert :notfound == SearchKatas.lin_search(4, [1, 3, 5])
    assert :notfound == SearchKatas.lin_search(6, [1, 3, 5])

    assert :notfound == SearchKatas.bin_search(0, [1, 3, 5])
    assert :notfound == SearchKatas.bin_search(2, [1, 3, 5])
    assert :notfound == SearchKatas.bin_search(4, [1, 3, 5])
    assert :notfound == SearchKatas.bin_search(6, [1, 3, 5])

    assert :notfound == SearchKatas.jmp_search(0, [1, 3, 5])
    assert :notfound == SearchKatas.jmp_search(2, [1, 3, 5])
    assert :notfound == SearchKatas.jmp_search(4, [1, 3, 5])
    assert :notfound == SearchKatas.jmp_search(6, [1, 3, 5])

    assert :notfound == SearchKatas.interpolation_search(0, [1, 3, 5])
    assert :notfound == SearchKatas.interpolation_search(2, [1, 3, 5])
    assert :notfound == SearchKatas.interpolation_search(4, [1, 3, 5])
    assert :notfound == SearchKatas.interpolation_search(6, [1, 3, 5])

    assert :notfound == SearchKatas.lin_search(0, [1, 3, 5, 7])
    assert :notfound == SearchKatas.lin_search(2, [1, 3, 5, 7])
    assert :notfound == SearchKatas.lin_search(4, [1, 3, 5, 7])
    assert :notfound == SearchKatas.lin_search(6, [1, 3, 5, 7])
    assert :notfound == SearchKatas.lin_search(8, [1, 3, 5, 7])

    assert :notfound == SearchKatas.bin_search(0, [1, 3, 5, 7])
    assert :notfound == SearchKatas.bin_search(2, [1, 3, 5, 7])
    assert :notfound == SearchKatas.bin_search(4, [1, 3, 5, 7])
    assert :notfound == SearchKatas.bin_search(6, [1, 3, 5, 7])
    assert :notfound == SearchKatas.bin_search(8, [1, 3, 5, 7])

    assert :notfound == SearchKatas.jmp_search(0, [1, 3, 5, 7])
    assert :notfound == SearchKatas.jmp_search(2, [1, 3, 5, 7])
    assert :notfound == SearchKatas.jmp_search(4, [1, 3, 5, 7])
    assert :notfound == SearchKatas.jmp_search(6, [1, 3, 5, 7])
    assert :notfound == SearchKatas.jmp_search(8, [1, 3, 5, 7])

    assert :notfound == SearchKatas.interpolation_search(0, [1, 3, 5, 7])
    assert :notfound == SearchKatas.interpolation_search(2, [1, 3, 5, 7])
    assert :notfound == SearchKatas.interpolation_search(4, [1, 3, 5, 7])
    assert :notfound == SearchKatas.interpolation_search(6, [1, 3, 5, 7])
    assert :notfound == SearchKatas.interpolation_search(8, [1, 3, 5, 7])
  end
end
