defmodule Sab do
  def asc_chars?(list) do
    _asc_chars?(list)
  end

  defp _asc_chars?([]), do: true
  defp _asc_chars?([head | tail]) when head >= 32 or head <= 126, do: _asc_chars?(tail)
  defp _asc_chars?([head | _tail]) when head < 32 or head > 126, do: false

  def center(list) do
    longest_length = get_longest_length(list, 0)

    pad(list, longest_length)
    |> Enum.join("\n")
  end

  defp pad([], longest), do: []

  defp pad([head | tail], longest),
    do: [pad_leading(head, div(longest - String.length(head), 2)) | pad(tail, longest)]

  defp pad_leading(str, 0), do: str
  defp pad_leading(str, l), do: pad_leading(" #{str}", l - 1)

  defp get_longest_length([], longest), do: longest

  defp get_longest_length([head | tail], longest),
    do: get_longest_length(tail, max(String.length(head), longest))
end
