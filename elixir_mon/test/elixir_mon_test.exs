defmodule ElixirMonTest do
  use ExUnit.Case
  doctest ElixirMon

  test "greets the world" do
    assert ElixirMon.hello() == :world
  end
end
