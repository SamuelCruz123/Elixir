defmodule EntradaReales do
  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> Util.ingresar(:entero)

    porcentaje_descuento =
      "Ingrese el porcentaje de descuento: "
      |> Util.ingresar(:real)

    valor_descuento =
      Util.calcular_valor_descuento(valor_producto, porcentaje_descuento)

    valor_final =
      Util.calcular_valor_final(valor_producto, valor_descuento)

    Util.generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje()
  end
end

EntradaReales.main()
