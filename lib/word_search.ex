defmodule WordSearch do
  import :math, only: [sqrt: 1]

  defmodule  WordPuzzle do
    defstruct words: [], letters: []
  end

  def find_letter(list_of_letters, subject) do
    flattened_list = List.flatten(list_of_letters)

    coordinates = Stream.with_index(flattened_list)
      |> Stream.filter(fn {x, _} -> x == subject end)
      |> Stream.map(fn {_, i} -> i end)
      |> Enum.map(fn(x) -> determine_coordinates(flattened_list, x) end)

    {:ok, coordinates}
  end
  
  def get_letter_at_position(letter_grid, coordinate) do
    {x, y} = coordinate
    
    Enum.at(letter_grid, y) 
    |> Enum.at(x)
  end

  defp determine_coordinates(list_of_letters, index) do
    number_of_rows = sqrt(Enum.count(list_of_letters)) |> trunc
    y = rem(index, number_of_rows)
    x = Integer.floor_div(index, number_of_rows)

    {x, y}
  end

  def find_neighbor(list_of_letters, subject, direction) do
    flattened_list = List.flatten(list_of_letters)
    index_of_subject = Enum.find_index(flattened_list, fn(x) -> x == subject end)

    case direction do
      :west -> {:ok, {direction, Enum.fetch(flattened_list, index_of_subject - 1) |> elem(1)}}
      :east -> {:ok, {direction, Enum.fetch(flattened_list, index_of_subject + 1) |> elem(1)}}

    end
  end

  def parse_puzzle(path) do
    list = path
    |> File.read!
    |> String.split("\n")
    |> Enum.map(fn(x) -> String.trim(x) |> String.split(",") end)

    [ words | letters] = list

    {:ok, %WordPuzzle{words: words, letters: letters}}
  end
end
