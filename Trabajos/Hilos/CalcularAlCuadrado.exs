defmodule ProcesosLigeros do
  def iniciar do
    principal = self()

    numeros = [1, 2, 3, 4, 5]

    Enum.each(numeros, fn numero ->
      spawn(fn ->
        resultado = numero * numero
        send(principal, {:resultado, numero, resultado})
      end)
    end)

    recibir_resultados(length(numeros))
  end

  defp recibir_resultados(0) do
    IO.puts("Todos los procesos terminaron.")
  end

  defp recibir_resultados(cantidad) do
    receive do
      {:resultado, numero, resultado} ->
        IO.puts("El proceso calculó: #{numero} x #{numero} = #{resultado}")
        recibir_resultados(cantidad - 1)
    end
  end
end

ProcesosLigeros.iniciar()
