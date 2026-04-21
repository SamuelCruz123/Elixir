defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def escribir_csv(clientes, nombre_archivo) do
    contenido =
      clientes
      |> Enum.map(fn cliente -> convertir_cliente_linea_csv(cliente) end)
      |> Enum.join("\n")

    File.write!(nombre_archivo, contenido <> "\n", [:append])
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad},#{cliente.altura}"
  end
end
