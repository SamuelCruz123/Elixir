defmodule SumaMatriz do
  def sumar_matriz([]), do: 0

  def sumar_matriz([fila | resto_filas]) do
    sumar_fila(fila) + sumar_matriz(resto_filas)
  end

  defp sumar_fila([]), do: 0

  defp sumar_fila([elemento | resto]) do
    elemento + sumar_fila(resto)
  end
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

resultado = SumaMatriz.sumar_matriz(matriz)
IO.puts("La suma total de la matriz es: #{resultado}")
