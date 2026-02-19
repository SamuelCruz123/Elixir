@docmoudledoc

defmodule NumeroCRUD do
  def new do
    []
  end

  def create(list, number) when is_list(list) and is_number(number) do
    list ++ [number]
  end

  def read(list) when is_list(list) do
    list
  end

  def read_at(list, index) when is_list(list) and is_integer(index) do
    Enum.at(list, index)
  end

  def update_at(list, index, new_number)
      when is_list(list) and is_integer(index) and is_number(new_number) do
    List.replace_at(list, index, new_number)
  end

  def delete_at(list, index) when is_list(list) and is_integer(index) do
    List.delete_at(list, index)
  end
end

list = NumeroCRUD.new()
list = NumeroCRUD.create(list, 10)
list = NumeroCRUD.create(list, 20)

IO.inspect(list)
IO.inspect(NumeroCRUD.read_at(list, 1))

list = NumeroCRUD.update_at(list, 0, 99)
IO.inspect(list)

list = NumeroCRUD.delete_at(list, 1)
IO.inspect(list)
