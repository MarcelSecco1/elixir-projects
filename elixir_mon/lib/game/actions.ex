defmodule ElixirMon.Game.Actions do
  alias ElixirMon.Game

  def fetch_move(move) do
    # info do player |> moves |> find_move(moves, move)
    Game.player() |> Map.get(:moves) |> find_move(move)
  end

  defp find_move(moves, move) do
    #        mapa de moves  error ao ser diferente
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      # compara o item com o move informado
      if value == move, do: {:ok, key} # retorna OK e a key do move ex: :move_avg
    end)
  end
end