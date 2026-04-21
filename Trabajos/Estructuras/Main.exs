defmodule Estructuras do
  def crear_cliente() do
    nombre =
      IO.gets("Ingrese nombre: ")
      |> String.trim()

    edad =
      IO.gets("Ingrese edad: ")
      |> String.trim()
      |> String.to_integer()

    altura =
      IO.gets("Ingrese altura: ")
      |> String.trim()
      |> String.to_float()

    Cliente.crear(nombre, edad, altura)
  end

  def crear_lista_clientes() do
    cantidad =
      IO.gets("¿Cuántos clientes desea ingresar?: ")
      |> String.trim()
      |> String.to_integer()

    Enum.map(1..cantidad, fn _ ->
      crear_cliente()
    end)
  end

  def main() do
    clientes = crear_lista_clientes()
    Cliente.escribir_csv(clientes, "clientes.csv")
  end
end

Estructuras.main()
