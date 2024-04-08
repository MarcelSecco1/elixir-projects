defmodule ElixirMon.Game.Status do
  def print_init_message(%{status: :started} = info) do
    IO.puts("\n========= O jogo começou! =========\n")
    IO.inspect(info)
    IO.puts("\n===================================\n")
  end

  def print_init_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n========= É sua vez #{player}! =========\n")
    IO.inspect(info)
    IO.puts("\n===================================\n")
  end

  def print_init_message(%{status: :game_over} = info) do
    IO.puts("\n=========  O jogo acabou!  =========\n")
    IO.inspect(info)
    IO.puts("\n===================================\n")
  end

  def print_error_move_message(move) do
    IO.puts("\n=========  Movimento inválido: #{move}!!  =========\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n=========  O Player atacou o Computer com #{damage} de dano!  =========\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n=========  O #{player} curou #{life}!!  =========\n")
  end
end
