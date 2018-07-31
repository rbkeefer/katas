defmodule NewEnum do
  def all?([], _func), do: true
  def all?([head | tail], func), do: func.(head) and all?(tail, func)

  def each([], _func), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]

  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, num), do: _split(list, 0, num, [])

  defp _split([head | tail], count, max, result) when count < max,
    do: _split(tail, count + 1, max, result ++ [head])

  defp _split(list, _count, _max, result), do: {result, list}

  def take(list, num), do: _take(list, 0, num)
  defp _take([head | tail], count, max) when count < max, do: [head | _take(tail, count + 1, max)]
  defp _take(list, _count, _max), do: []
end
