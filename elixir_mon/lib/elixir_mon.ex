defmodule ElixirMon do
  alias ElixirMon.Game.{Status, Actions}
  alias ElixirMon.{Game, Player}

  @computer_name "Rotom"
  def create_player(name, move_avg, move_rdn, move_heal) do
    Player.build(name, move_avg, move_rdn, move_heal)
  end

  def start_game(player) do
    @computer_name |> create_player(:punch, :kick, :heal) |> Game.start(player)
    # computer = create_player("Computer", :punch, :kick, :heal)
    # Game.start(computer, player)

    Status.print_init_message()
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_error_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "Realiza cura..."
      move -> Actions.atack(move)
    end
  end

end
