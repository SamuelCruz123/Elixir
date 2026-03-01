defmodule Acceso do
    def main do
        nombre_usuario = "Ingrese un nombre de usuario: "
        |> Util.ingresar(:texto)

        IO.inspect(validar_acceso(nombre_usuario))
    end

    defp validar_acceso(nombre_usuario) do
        cond do
            String.length(nombre_usuario) not in 5..12 -> {:error, "El nombre de usuario debe contener entre 5 y 12 caracteres"}
            Regex.match?(~r/[A-Z]/, nombre_usuario) ->{:error, "El nombre de usuario debe estar en minuscula"}
            Regex.match?(~r/\s/, nombre_usuario) -> {:error, "el nombre de usuario no debe contener espacios"}
            Regex.match?(~r/[@#$%]/, nombre_usuario) -> {:error, "El nombre de usuairo no debe contener caracteres especiales"}
            true -> {:ok, "Nombre de usuario aceptado, bienvenido #{nombre_usuario}"}
        end
    end
end

Acceso.main()
