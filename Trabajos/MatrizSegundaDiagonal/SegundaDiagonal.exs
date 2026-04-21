defmodule DiagonalSecundaria do
  def sumar_diagonal_secundaria(matriz) do
    n = longitud(matriz)
    sumar_diagonal_secundaria(matriz, 0, n)
  end

  defp sumar_diagonal_secundaria([], _fila, _n), do: 0

  defp sumar_diagonal_secundaria([fila | resto_filas], fila_actual, n) do
    columna = n - 1 - fila_actual
    obtener_elemento(fila, columna) + sumar_diagonal_secundaria(resto_filas, fila_actual + 1, n)
  end

  defp obtener_elemento([elemento | _], 0), do: elemento
  defp obtener_elemento([_ | resto], indice), do: obtener_elemento(resto, indice - 1)

  defp longitud([]), do: 0
  defp longitud([_ | resto]), do: 1 + longitud(resto)
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

resultado = DiagonalSecundaria.sumar_diagonal_secundaria(matriz)
IO.puts("La suma de la diagonal secundaria es: #{resultado}")
