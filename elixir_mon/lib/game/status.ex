defmodule ElixirMon.Game.Status do
  alias ElixirMon.Game

  def print_init_message() do
    IO.puts("\n========= O jogo começou! =========\n")
    IO.inspect(Game.info())
    IO.puts("\n===================================\n")
  end

  def print_error_move_message(move) do
    IO.puts("\n========= Movimento inválido: #{move}!! =========\n")
  end
end
