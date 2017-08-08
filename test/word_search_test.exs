defmodule WordSearchTest do
  use ExUnit.Case
  doctest WordSearch

  test "can determine if letter exists in row" do
    assert WordSearch.find_letter(["a", "b", "c"], "a") == {:ok, {0, 0}}
  end

  test "can determine if letter exists later in a row" do
    assert WordSearch.find_letter(["a", "b", "c"], "b") == {:ok, {0, 1}}
  end
end
