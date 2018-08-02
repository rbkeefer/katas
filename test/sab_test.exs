defmodule SabTest do
  use ExUnit.Case

  test "check for ASCII printable characters" do
    assert true == Sab.asc_chars?('1w3r6u9')
    assert true == Sab.asc_chars?('~ ~')
  end

  test "center a list of strings" do
    assert "  cat\n zebra\nelephant" = Sab.center(["cat", "zebra", "elephant"])
  end
end
