defmodule MatrizProcesos do
  def main do
    matriz = [
      [60, 22, 41, 5],
      [13, 33, 44, 5],
      [89, 10, 100, 99],
      [5, 101, 6, 34]
    ]

    tarea_s1 =
      Task.async(fn ->
        sumar_debajo_diagonal(matriz)
      end)

    tarea_s2 =
      Task.async(fn ->
        promedio_matriz(matriz)
      end)

    a = Task.await(tarea_s1)
    b = Task.await(tarea_s2)

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
end

MatrizProcesos.main()
