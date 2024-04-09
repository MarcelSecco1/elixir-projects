defmodule ElixirMonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias ElixirMon.Player

  describe "create_player/4" do
    test "return a player" do
      expected_response = %Player{
        life: 100,
        moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco},
        name: "Marcel"
      }

      assert expected_response == ElixirMon.create_player("Marcel", :soco, :chute, :cura)
    end
  end

  describe "start_game/1" do
    test "when started game, return message" do
      player = ElixirMon.create_player("Marcel", :soco, :chute, :cura)

      messages =
        capture_io(fn ->
          assert ElixirMon.start_game(player) == :ok
        end)

      # messages retorna uma string gigante
      # o operador =~ verifica dentro da string determinadas coisas
      assert messages =~ "O jogo começou!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Marcel", :soco, :chute, :cura)

      capture_io(fn ->
        ElixirMon.start_game(player)
      end)

      :ok
    end

    test "when move is valid" do
      messages =
        capture_io(fn ->
          assert ElixirMon.make_move(:soco) == :ok
        end)

      assert messages =~ "Player atacou o Computer"
      assert messages =~ "turn: :player"
      assert messages =~ "turn: :computer"
      assert messages =~ "É sua vez computer!"
      assert messages =~ "O Computer atacou o Player"
    end

    test "when move is invalid" do
      messages =
        capture_io(fn ->
          ElixirMon.make_move(:sdasdad)
        end)

      assert messages =~ "Movimento inválido: sdasdad!!"
    end
  end
end
