defmodule Fibonacci do
  def main do
    fib(4)
  end

  defp fib(0) do
    0
  end

  defp fib(1) do
    1
  end

  defp fib(n) do
    fib(n - 1) + fib(n - 2)
  end
end

