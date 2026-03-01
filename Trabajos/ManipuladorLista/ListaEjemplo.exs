defmodule ListaEjemplo do
  # Suma todos los elementos de una lista de números
  def sumar(lista) do
    Enum.sum(lista)
  end

  # Filtra los números pares de una lista
  def filtrar_pares(lista) do
    Enum.filter(lista, fn x -> rem(x, 2) == 0 end)
  end

  # Duplica cada número en la lista
  def duplicar(lista) do
    Enum.map(lista, fn x -> x * 2 end)
  end

  # Imprime cada elemento de la lista con un mensaje
  def imprimir(lista) do
    Enum.each(lista, fn x -> IO.puts("Elemento: #{x}") end)
  end
end

# Ejemplo de uso
numeros = [1, 2, 3, 4, 5]

IO.puts("Suma: #{ListaEjemplo.sumar(numeros)}")
IO.inspect(ListaEjemplo.filtrar_pares(numeros), label: "Pares")
IO.inspect(ListaEjemplo.duplicar(numeros), label: "Duplicados")
ListaEjemplo.imprimir(numeros)
