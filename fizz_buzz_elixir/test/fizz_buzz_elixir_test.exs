defmodule FizzBuzzElixirTest do
  use ExUnit.Case

  describe "build/1" do
    #     descrição do test
    test "when a valid file is provided, return the converted list" do
      #     resposta esperada
      response = {:ok, [1, 2, "Fizz", 4, "Buzz", "Buzz", "FizzBuzz", "Buzz"]}
      assert FizzBuzzElixir.build("numbers.txt") == response
    end

    #     descrição do test
    test "when an invalid file is provided, return an error" do
      #     resposta esperada
      response = {:error, "Erro ao ler o arquivo, razäo: enoent"}
      assert FizzBuzzElixir.build("invalid_file.txt") == response
    end
  end
end
