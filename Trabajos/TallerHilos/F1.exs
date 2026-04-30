defmodule MatrizProcesos do
  def main do
    matriz = [
      [60, 22, 41, 5],
      [13, 33, 44, 5],
      [89, 10, 100, 99],
      [5, 101, 6, 34]
    ]

    proceso_principal = self()


    spawn(fn ->
      resultado_s1 = sumar_debajo_diagonal(matriz)
      send(proceso_principal, {:s1, resultado_s1})
    end)

    spawn(fn ->
      resultado_s2 = promedio_matriz(matriz)
      send(proceso_principal, {:s2, resultado_s2})
    end)


    resultados = esperar_resultados(%{})

    a = resultados[:s1]
    b = resultados[:s2]


    c = a * b


    IO.puts("S1 - Suma debajo de la diagonal principal: #{a}")
    IO.puts("S2 - Promedio de todos los números: #{b}")
    IO.puts("S3 - C = a * b")
    IO.puts("S4 - Resultado final de C = #{c}")
  end


  defp sumar_debajo_diagonal(matriz) do
    matriz
    |> Enum.with_index()
    |> Enum.reduce(0, fn {fila, i}, suma ->
      suma_fila =
        fila
        |> Enum.with_index()
        |> Enum.reduce(0, fn {numero, j}, acc ->
          if i > j do
            acc + numero
          else
            acc
          end
        end)

      suma + suma_fila
    end)
  end


  defp promedio_matriz(matriz) do
    numeros = List.flatten(matriz)

    suma = Enum.sum(numeros)
    cantidad = length(numeros)

    suma / cantidad
  end


  defp esperar_resultados(resultados) when map_size(resultados) == 2 do
    resultados
  end

  defp esperar_resultados(resultados) do
    receive do
      {:s1, valor} ->
        esperar_resultados(Map.put(resultados, :s1, valor))

      {:s2, valor} ->
        esperar_resultados(Map.put(resultados, :s2, valor))
    end
  end
end

MatrizProcesos.main()
