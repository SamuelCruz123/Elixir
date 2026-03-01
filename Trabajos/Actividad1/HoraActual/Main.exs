defmodule Main do
  def main do
    nombre = IO.gets("Ingrese su nombre: ")
             |> String.trim()

    mensaje = Util.generar_saludo(nombre)

    IO.puts(mensaje)
  end
end

Main.main()
