defmodule Parqueadero do

  def main do
    horas =
      IO.gets("Horas de permanencia: ")
      |> String.trim()
      |> String.to_integer()

    tipo_cliente =
      IO.gets("Tipo cliente (1=frecuente, 2=regular): ")
      |> String.trim()
      |> String.to_integer()

    tipo_vehiculo =
      IO.gets("Tipo vehículo (1=eléctrico, 2=convencional): ")
      |> String.trim()
      |> String.to_integer()

    dia =
      IO.gets("Día (1=fin de semana, 2=entre semana): ")
      |> String.trim()
      |> String.to_integer()


    tarifa_base = Util.calcular_tarifa_base(horas)
    porcentaje_descuento = Util.calcular_descuento(tipo_cliente, tipo_vehiculo, dia)

    valor_descuento = tarifa_base * porcentaje_descuento
    total_pagar = tarifa_base - valor_descuento


    IO.puts("\n----- DESGLOSE -----")
    IO.puts("Tarifa base: $#{tarifa_base}")
    IO.puts("Descuento aplicado: #{porcentaje_descuento * 100}%")
    IO.puts("Valor descuento: $#{Float.round(valor_descuento, 2)}")
    IO.puts("Total a pagar: $#{Float.round(total_pagar, 2)}")
  end

end


Parqueadero.main()
