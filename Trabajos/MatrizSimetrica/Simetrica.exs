defmodule MatrizSimetrica do
  def simetrica?(matriz) do
    n = longitud(matriz)

    if es_cuadrada?(matriz, n) do
      verificar_filas(matriz, 0, n)
    else
      false
    end
  end

  defp verificar_filas(_matriz, fila, n) when fila >= n, do: true

  defp verificar_filas(matriz, fila, n) do
    if verificar_columnas(matriz, fila, fila + 1, n) do
      verificar_filas(matriz, fila + 1, n)
    else
      false
    end
  end

  defp verificar_columnas(_matriz, _fila, columna, n) when columna >= n, do: true

  defp verificar_columnas(matriz, fila, columna, n) do
    a = obtener_en_matriz(matriz, fila, columna)
    b = obtener_en_matriz(matriz, columna, fila)

    if a == b do
      verificar_columnas(matriz, fila, columna + 1, n)
    else
      false
    end
  end

  defp obtener_en_matriz(matriz, fila, columna) do
    fila_lista = obtener_fila(matriz, fila)
    obtener_elemento(fila_lista, columna)
  end

  defp obtener_fila([fila | _], 0), do: fila
  defp obtener_fila([_ | resto], indice), do: obtener_fila(resto, indice - 1)

  defp obtener_elemento([elemento | _], 0), do: elemento
  defp obtener_elemento([_ | resto], indice), do: obtener_elemento(resto, indice - 1)

  defp es_cuadrada?([], _n), do: true

  defp es_cuadrada?([fila | resto], n) do
    if longitud(fila) == n do
      es_cuadrada?(resto, n)
    else
      false
    end
  end

  defp longitud([]), do: 0
  defp longitud([_ | resto]), do: 1 + longitud(resto)
end

matriz = [
  [1, 2, 3],
  [2, 4, 5],
  [3, 5, 6]
]

IO.puts("¿La matriz es simétrica?: #{MatrizSimetrica.simetrica?(matriz)}")
