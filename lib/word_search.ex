defmodule WordSearch do
  def find_letter(list_of_letters, subject) do
    index = Enum.find_index(list_of_letters, fn(x) -> x == subject end)
    {:ok, {0, index}}
  end
end
