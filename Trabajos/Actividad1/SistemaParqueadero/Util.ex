defmodule Util do

  # Calcula la tarifa base según horas
  def calcular_tarifa_base(horas) do
    cond do
      horas <= 2 ->
        3000

      horas <= 5 ->
        3000 + (horas - 2) * 2500

      horas <= 8 ->
        3000 + 3 * 2500 + (horas - 5) * 2000

      true ->
        18000
    end
  end

  # Calcula el porcentaje total de descuento
  def calcular_descuento(tipo_cliente, tipo_vehiculo, dia) do
    descuento_cliente =
      if tipo_cliente == 1, do: 0.15, else: 0.0

    descuento_vehiculo =
      if tipo_vehiculo == 1, do: 0.20, else: 0.0

    descuento_dia =
      if dia == 1, do: 0.10, else: 0.0

    descuento_cliente + descuento_vehiculo + descuento_dia
  end

end
