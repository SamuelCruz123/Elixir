defmodule MaximoMatriz do
  def maximo_matriz([fila | resto_filas]) do
    max_inicial = maximo_fila(fila)
    maximo_matriz(resto_filas, max_inicial)
  end

  defp maximo_matriz([], max_actual), do: max_actual

  defp maximo_matriz([fila | resto_filas], max_actual) do
    max_fila = maximo_fila(fila)

    nuevo_max =
      if max_fila > max_actual do
        max_fila
      else
        max_actual
      end

    maximo_matriz(resto_filas, nuevo_max)
  end

  defp maximo_fila([elemento]), do: elemento

  defp maximo_fila([elemento | resto]) do
    max_resto = maximo_fila(resto)

    if elemento > max_resto do
      elemento
    else
      max_resto
    end
  end
end

matriz = [
  [1, 8, 3],
  [4, 15, 6],
  [7, 2, 9]
]

resultado = MaximoMatriz.maximo_matriz(matriz)
IO.puts("El valor máximo de la matriz es: #{resultado}")
