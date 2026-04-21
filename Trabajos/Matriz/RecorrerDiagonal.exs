defmodule DiagonalRecursiva do
  def recorrer_diagonal(matriz), do: recorrer_diagonal(matriz, 0)

  defp recorrer_diagonal([], _indice), do: :ok

  defp recorrer_diagonal([fila | resto_filas], indice) do
    elemento = obtener_elemento(fila, indice)
    IO.puts(elemento)
    recorrer_diagonal(resto_filas, indice + 1)
  end

  defp obtener_elemento([elemento | _], 0), do: elemento
  defp obtener_elemento([_ | resto], indice), do: obtener_elemento(resto, indice - 1)
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Diagonal principal:")
DiagonalRecursiva.recorrer_diagonal(matriz)
