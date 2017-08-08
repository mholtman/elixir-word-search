defmodule WordSearch do
  def find_letter(list_of_letters, subject) do
    index = List.flatten(list_of_letters) |>
      Enum.find_index(fn(x) -> x == subject end)
      size = Enum.count(list_of_letters)
      y = rem(index, size)
      x = Integer.floor_div(index, size)
    {:ok, {x, y}}
  end
end
