defmodule ElixirMon.GameTest do
  use ExUnit.Case
  alias ElixirMon.{Player, Game}

  describe "start/2" do
    test "start the game state" do
      player = Player.build("Marcel", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      assert {:ok, _} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "return info of the game" do
      player = Player.build("Marcel", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      responseExpected = %{
        status: :started,
        player: %Player{
          life: 100,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Marcel"
        },
        computer: %Player{
          life: 100,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Computer"
        },
        turn: :player
      }

      assert Game.info() == responseExpected
    end
  end

  describe "update/1" do
    test "return the update of the game" do
      player = Player.build("Marcel", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %Player{
          life: 100,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Marcel"
        },
        computer: %Player{
          life: 100,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Computer"
        },
        turn: :player
      }

      assert Game.info() == expected_response

      update_info = %{
        status: :started,
        player: %Player{
          life: 85,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Marcel"
        },
        computer: %Player{
          life: 50,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Computer"
        },
        turn: :player
      }

      Game.update(update_info)

      expected_response = %{update_info | turn: :computer, status: :continue}

      assert Game.info() == expected_response
    end
  end

  describe "player/0" do
    test "return the player in game" do
      player = Player.build("Marcel", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %Player{
        life: 100,
        moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
        name: "Marcel"
      }

      assert Game.player() == expected_response
    end
  end

  describe "turn/0" do
    test "return the player in turn" do
      player = Player.build("Marcel", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      assert Game.turn() == :player

    end
  end

  describe "fetch_player/1" do
    test "return all data of the select player" do
      player = Player.build("Marcel", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %Player{
        life: 100,
        moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
        name: "Marcel"
      }

      assert Game.fetch_player(:player) == expected_response

      expected_response = %Player{
        life: 100,
        moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
        name: "Computer"
      }

      assert Game.fetch_player(:computer) == expected_response
    end
  end
end
