defmodule WordSearchTest do
  use ExUnit.Case
  doctest WordSearch

  alias WordSearch.WordPuzzle

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

  test "can parse words from file" do
    expected_words = ["BURRITOS","ENCHILADAS","GUACAMOLE","QUESO","SALSA","TACOS","TORTILLA"]
    {:ok, parsed_puzzle} = WordSearch.parse_puzzle("test/sample_puzzles/mexican_food.txt")
    assert expected_words == parsed_puzzle.words
  end

  test "can parse letters from file into nested arrays" do
    {:ok, word_puzzle} = WordSearch.parse_puzzle("test/sample_puzzles/mexican_food.txt")
    expected_first_row = ["T","A","C","O","S","J","E","A","J","K","I","T","N","C","S"]
    assert expected_first_row == hd(word_puzzle.letters)
  end

  test "can find the last row" do
    {:ok, word_puzzle} = WordSearch.parse_puzzle("test/sample_puzzles/mexican_food.txt")
    expected_last_row = ["R", "T", "J", "B", "L", "H", "P", "Y", "J", "F",
      "A", "M", "Q", "V", "E"]
    assert expected_last_row == Enum.at(word_puzzle.letters, -1)
  end

  test "can get position of letter within grid" do
    assert("a" == WordSearch.get_letter_at_position([["a", "b", "c"],
                                  ["d", "e", "f"],
                                  ["g", "h", "i"]], {0,0}))

  end

  test "can get position of non-origin letter within grid" do
    assert("f" == WordSearch.get_letter_at_position([["a", "b", "c"],
                                  ["d", "e", "f"],
                                  ["g", "h", "i"]], {2,1}))

  
  end
end
