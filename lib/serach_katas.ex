defmodule SearchKatas do
  @moduledoc """
  These are solutions to common katas.

  @doc
  Katas implmented to date include:
    lin_search: a linear recursive search
    chop: a binary recursive search

  ## Examples

      iex> Katas.lin_search(1, [1, 3, 5, 7])
      1

      iex> Katas.bin_search(1, [1, 3, 5, 7])
      1

  """
  def lin_search(_, []) do
    :notfound
  end

  def lin_search(num, [head | tail]) do
    if num == head do
      head
    else
      lin_search(num, tail)
    end
  end

  def bin_search(_, []) do
    :notfound
  end

  def bin_search(num, num_list) when 1 == length(num_list) do
    if List.first(num_list) == num do
      num
    else
      :notfound
    end
  end

  def bin_search(num, num_list) do
    midpoint = (length(num_list) / 2) |> round
    element = Enum.at(num_list, midpoint)
    [left | right] = Enum.chunk(num_list, midpoint, midpoint, [])

    cond do
      element == num ->
        num

      element > num ->
        bin_search(num, List.flatten(left))

      true ->
        bin_search(num, List.flatten(right))
    end
  end

  def jmp_search(_, []) do
    :notfound
  end

  def jmp_search(num, num_list) when 1 == length(num_list) do
    if List.first(num_list) == num do
      num
    else
      :notfound
    end
  end

  def jmp_search(num, num_list) do
    jump = :math.sqrt(length(num_list)) |> round
    element = Enum.at(num_list, jump)
    [left | right] = Enum.chunk(num_list, jump, jump, [])

    cond do
      element == num ->
        num

      element > num ->
        jmp_search(num, List.flatten(left))

      true ->
        jmp_search(num, List.flatten(right))
    end
  end

  def interpolation_search(_, []) do
    :notfound
  end

  def interpolation_search(num, num_list) when 1 == length(num_list) do
    if List.first(num_list) == num do
      num
    else
      :notfound
    end
  end

  def interpolation_search(num, num_list) do
    #    pos = lo + [ (x-arr[lo])*(hi-lo) / (arr[hi]-arr[Lo]) ]
    lo = 0
    hi = length(num_list) - 1

    pos =
      (lo +
         (num - List.first(num_list)) * (hi - lo) / (List.last(num_list) - List.first(num_list)))
      |> round

    cond do
      pos < 0 ->
        :notfound

      List.first(num_list) > num ->
        :notfound

      List.last(num_list) < num ->
        :notfound

      List.first(num_list) == num ->
        num

      List.last(num_list) == num ->
        num

      Enum.at(num_list, pos) == num ->
        num

      Enum.at(num_list, pos) > num ->
        [left | right] = Enum.chunk(num_list, pos, pos, [])
        interpolation_search(num, List.flatten(left))

      true ->
        [_ | right] = Enum.chunk(num_list, pos + 1, pos, [])
        interpolation_search(num, List.flatten(right))
    end
  end
end
