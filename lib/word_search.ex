defmodule WordSearch do
  import :math, only: [sqrt: 1]

  def find_letter(list_of_letters, subject) do
    flattened_list = List.flatten(list_of_letters)

    coordinates = Stream.with_index(flattened_list)
      |> Stream.filter(fn {x, _} -> x == subject end)
      |> Stream.map(fn {_, i} -> i end)
      |> Enum.map(fn(x) -> determine_coordinates(flattened_list, x) end)

    {:ok, coordinates}
  end

  defp determine_coordinates(list_of_letters, index) do
    number_of_rows = sqrt(Enum.count(list_of_letters)) |> trunc
    y = rem(index, number_of_rows)
    x = Integer.floor_div(index, number_of_rows)
    {x, y}
  end
end
