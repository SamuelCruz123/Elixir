defmodule Util do

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    ingresar(mensaje, &String.to_integer/1, :entero)
  end

  def ingresar(mensaje, :real) do
    ingresar(mensaje, &String.to_float/1, :real)
  end

  defp ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        IO.puts("Error, se espera que ingrese un número #{tipo_dato}")
        ingresar(mensaje, parser, tipo_dato)
    end
  end

  def calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * (porcentaje_descuento / 100)
  end

  def calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  def generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = Float.round(valor_descuento, 2)
    valor_final = Float.round(valor_final, 2)
    "Valor de descuento: $#{valor_descuento} y el valor final: $#{valor_final}"
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

end
