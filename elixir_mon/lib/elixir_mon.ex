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
    Actions.fetch_move(move)
  end
end
