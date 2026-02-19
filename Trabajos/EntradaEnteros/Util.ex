defmodule Util do
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      ingresar(mensaje, :texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        mostrar_error("Error, se espera que ingrese un número entero\n")
        ingresar(mensaje, :entero)
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
