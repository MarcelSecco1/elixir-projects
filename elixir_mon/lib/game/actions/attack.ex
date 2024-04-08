defmodule ElixirMon.Game.Actions.Attack do
  alias ElixirMon.Game
  @move_avg_power 18..15
  @move_rnd_power 10..35

  def atack_opponent(opponent, move) do
    damage = calculate_power(move)

    opponent
      |> Game.fetch_player()
      |> Map.get(:life)
      |> calculete_total_life(damage)
      |> update_opponent_life(opponent)
  end

  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)

  defp calculete_total_life(life, damage) when life - damage <= 0, do: 0
  defp calculete_total_life(life, damage), do:  life - damage

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponent)
  end

  defp update_game(player, opponent) do
    Game.info()
      |> Map.put(opponent, player)
      |> Game.update()
  end
end
