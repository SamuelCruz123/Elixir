defmodule AccesoAppTest do
  use ExUnit.Case
  doctest AccesoApp

  test "greets the world" do
    assert AccesoApp.hello() == :world
  end
end
