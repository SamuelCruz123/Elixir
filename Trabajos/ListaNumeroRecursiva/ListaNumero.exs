#defmodule ListaRecursiva do
  # Caso base: lista vacía
  #def suma([]), do: 0

  # Caso recursivo: cabeza + cola
  #def suma([head | tail]) do
    #head + suma(tail)

  #end
#end

# Ejemplo de uso
#IO.puts(ListaRecursiva.suma([1, 2, 3, 4]))

def modulo votos do
  def main do
    voto =

    Util.leer("Ingrese voto")
    |> String.trim()

    resultado = validar_votos(voto)

    case resultado do
      {:ok, voto_valido} ->
        Util.mostrar_mensaje(m)
      {:error, voto_invalido}
    end
  end

  def validar_votos(voto) do
    []
    |>validar_candidato(voto)
    |>validar_codigo_estudiante(voto)
    |>validar_jornada(voto)
    |>final()

  end

  def validar_codigo(e,voto)
    if string.length(voto)!= 8 do
      lista ++["debe tener exactamente 8 digitos numericos"]
    else
      lista
    end
  end

  def validar_jornada(e, voto)
    if string.contains?[:diurna, :nocturna] do
      lista
    else
      [debe estar en una jornada]
    end
  def validar_candidato(e, voto)
    if string.contains?[":candidato_a", ":candidato_b", ":candidato_c" ]
    lista
  else
  ["debe elegir uno de los candidatos"]

  def final ([])
    do :{:ok "voto registrado"}
  def final (e)
    do :{:error, "errores"}

end
