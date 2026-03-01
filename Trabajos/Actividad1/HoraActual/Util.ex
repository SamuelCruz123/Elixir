defmodule Util do

  def obtener_hora_actual do
    {{_anio, _mes, _dia}, {hora, _min, _seg}} = :calendar.local_time()
    hora
  end


  def generar_saludo(nombre) do
    hora = obtener_hora_actual()

    cond do
      hora >= 0 and hora < 12 ->
        "Buenos días #{nombre}"

      hora >= 12 and hora < 18 ->
        "Buenas tardes #{nombre}"

      hora >= 18 and hora <= 23 ->
        "Buenas noches #{nombre}"
    end
  end
end
