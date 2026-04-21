defmodule ListaRecursiva do
  # Caso base: lista vacía
  def imprimir([]), do: :ok

  # Caso recursivo: cabeza + cola
  def imprimir([head | tail]) do
    IO.puts(head)
    imprimir(tail)
  end
end

defmodule Votos do
  def main do
    candidato =
      IO.gets("Ingrese candidato: ")
      |> String.trim()
      |> String.downcase()

    codigo =
      IO.gets("Ingrese código de estudiante: ")
      |> String.trim()

    jornada =
      IO.gets("Ingrese jornada: ")
      |> String.trim()
      |> String.downcase()

    voto = %{
      candidato: candidato,
      codigo: codigo,
      jornada: jornada
    }

    case validar_voto(voto) do
      {:ok, mensaje} ->
        IO.puts(mensaje)

      {:error, errores} ->
        IO.puts("Se encontraron errores:")

        Enum.each(errores, fn error ->
          IO.puts("- " <> error)
        end)
    end
  end

  def validar_voto(voto) do
    []
    |> validar_candidato(voto)
    |> validar_codigo_estudiante(voto)
    |> validar_jornada(voto)
    |> finalizar()
  end

  def validar_candidato(errores, voto) do
    candidatos_validos = ["candidato_a", "candidato_b", "candidato_c"]

    if voto.candidato in candidatos_validos do
      errores
    else
      errores ++ ["Debe elegir uno de los candidatos válidos"]
    end
  end

  def validar_codigo_estudiante(errores, voto) do
    if String.length(voto.codigo) == 8 and String.match?(voto.codigo, ~r/^\d+$/) do
      errores
    else
      errores ++ ["El código debe tener exactamente 8 dígitos numéricos"]
    end
  end

  def validar_jornada(errores, voto) do
    jornadas_validas = ["diurna", "nocturna"]

    if voto.jornada in jornadas_validas do
      errores
    else
      errores ++ ["Debe estar en una jornada válida: diurna o nocturna"]
    end
  end

  def finalizar([]), do: {:ok, "Voto registrado correctamente"}
  def finalizar(errores), do: {:error, errores}
end

# Ejemplo de uso
ListaRecursiva.imprimir([1, 2, 3, 4, 5])
Votos.main()
