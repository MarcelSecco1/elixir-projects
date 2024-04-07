defmodule FizzBuzzElixir do
  def build(file_name) do
    # case File.read(file_name) do
    #   {:error, reason} -> reason
    #   {:ok, content} -> content
    # end
    file_name |> File.read() |> handle_file_read()

    # file = File.read(file_name)
    # handle_file_read(file) # chama a função handle_file_read com o retorno da função File.read
  end

  # caso de erro, ele retorna a razão do erro
  defp handle_file_read({:error, reason}), do: {:error, "Erro ao ler o arquivo, razäo: #{reason}"}

  # caso de sucesso, ele retorna o conteúdo do arquivo
  defp handle_file_read({:ok, content}) do
    # transforma o conteúdo do arquivo em uma lista de strings separadas por vírgula
    #       list = String.split(content, ",")
    # transforma a lista de strings em uma lista de inteiros
    #       Enum.map(list, &String.to_integer/1)
    # chama a função verificar_div com cada elemento da lista
    #   ****** o /1 é a aridade da função, ou seja, a quantidade de argumentos que ela recebe
    #       Enum.map(list, &verificar_div/1)
    content = content |> String.split(",") |> Enum.map(&verificar_div/1)
    {:ok, content}
  end

  defp verificar_div(element) do
    element |> String.to_integer() |> verifica()

    # chamada de verificação
    #     verifica(number)
  end

  # bloco de verificação em ordem estruturada
  defp verifica(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  defp verifica(number) when rem(number, 3) == 0, do: "Fizz"
  defp verifica(number) when rem(number, 5) == 0, do: "Buzz"
  defp verifica(number), do: number
end
