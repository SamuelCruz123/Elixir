defmodule ListaRecursiva do
  # Caso base: lista vacía
  def imprimir([]), do: :ok

  # Caso recursivo: cabeza + cola
  def imprimir([head | tail]) do
    IO.puts(head)
    imprimir(tail)
  end
end

# Ejemplo de uso
ListaRecursiva.imprimir([1, 2, 3, 4, 5])
