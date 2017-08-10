defmodule WordSearchTest do
  use ExUnit.Case
  doctest WordSearch

  test "can determine if letter exists in row" do
    assert WordSearch.find_letter(["a"], "a") == {:ok, [{0, 0}]}
  end

  test "can find letter in two-dimensional array" do
    assert WordSearch.find_letter([["a", "b", "c"],
                                  ["d", "e", "f"],
                                  ["g", "h", "i"]], "e") == {:ok, [{1, 1}]}
  end
  test "can find letter in 2x2 two-dimensional array" do
    assert WordSearch.find_letter([["a", "b"],
                                  ["c", "d"]], "d") == {:ok, [{1, 1}]}
  end

  test "can find multiple occurrences of a letter in a grid" do
    assert WordSearch.find_letter([["a", "a"],
                                  ["b", "c"]], "a") == {:ok, [{0, 0}, {0,1}]}
  end

  test "can find western neighbor" do
    assert WordSearch.find_neighbor([["a", "b", "c"],
                                  ["d", "e", "f"],
                                  ["g", "h", "i"]], "e", :west)
                                  == {:ok, {:west, "d"}}
  end

  test "can find eastern neighbor" do
    assert WordSearch.find_neighbor([["a", "b", "c"],
                                  ["d", "e", "f"],
                                  ["g", "h", "i"]], "e", :east)
                                  == {:ok, {:east, "f"}}
  end
end
