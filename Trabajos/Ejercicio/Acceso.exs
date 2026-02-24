defmodule Acceso do
    def main do
        nombre_Usuario = "Ingrese el nombre de usuario: "
        |> Util.ingresar(:texto)


        edad = "Ingrese la edad: "
        |>Util.ingresar(:entero)

        credenciales = "¿tiene credenciales registradas? Responda con si o no: "
        |>Util.convertir_a_boolean(:si_no)

        intentos_Fallidos = "¿Cuantas intentos fallidos lleva?: "
        |>Util.ingresar(:entero)

        resultado = validar_Acceso(nombre_Usuario, edad, credenciales, intentos_Fallidos)
        mostrar_resultado(resultado)
        end

    defp validar_Acceso(nombre_Usuario, edad, credenciales, intentos_Fallidos) do
        unless credenciales do
          {:Error, "No tiene credenciales, acceso denegado"}
        else
        unless edad >= 18 do
            {:Error, "No es Mayor de edad, acceso denegado"}
        else
          unless intentos_Fallidos < 3 do
            {:Error, "Demasiados intentos, acceso denegado"}
          else
            {:Ok, "Acceso concedido. Bienvenido #{nombre_Usuario}."}

                end
            end
        end
    end

   defp mostrar_resultado({estado, mensaje}) do
    IO.puts("{#{estado}: #{mensaje}}")
    end
end

Acceso.main()
