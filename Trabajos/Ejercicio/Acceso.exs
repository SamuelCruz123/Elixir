defmodule Acceso do
    def main do
        nombre_Usuario = "Ingrese el nombre de usuario: \n"
        |> Util.ingresar(:texto)


        edad = "Ingrese la edad: \n"
        |>Util.ingresar(:entero)

        credenciales = "¿tiene credenciales registradas? Responda con si o no: \n"
        |>Util.convertir_a_boolean(:si_no)

        intentos_Fallidos = "¿Cuantas intentos fallidos lleva? \n"
        |>Util.ingresar(:entero)

        resultado = validar_Acceso(nombre_Usuario, edad, credenciales, intentos_Fallidos)
        mostrar_resultado(resultado)
        end

    defp validar_Acceso(nombre_Usuario, edad, credenciales, intentos_Fallidos) do
        unless credenciales do
          {:error, "No tiene credenciales, acceso denegado"}
        else
        unless edad >= 18 do
            {:erros, "No es Mayor de edad, acceso denegado"}
        else
          unless intentos_Fallidos < 3 do
            {:error, "Demasiados intesntos, acceso denegado"}
          else
            {:ok, "Acceso concedid. Bienvenido #{nombre_Usuario}."}

                end
            end
        end
    end

    defp mostrar_resultado({:ok, mensaje}), do: IO.puts(mensaje)
    defp mostrar_resultado({:error, mensaje}), do: IO.puts(mensaje)
end


Acceso.main()
