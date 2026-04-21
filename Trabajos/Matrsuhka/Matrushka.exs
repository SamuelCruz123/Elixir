defmodule Matrushka do
  def abrir(1), do: abrir(1, 5)

  def abrir(n, limite) when n <= limite do
    IO.puts("Abrir atrushka #{n}")
    abrir(n + 1, limite)
    IO.puts("cerrar matrushka #{n}")
  end

  def abrir(n, limite) when n > limite do
    :ok
  end
end

Matrushka.abrir(1)
