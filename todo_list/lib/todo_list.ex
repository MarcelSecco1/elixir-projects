defmodule TodoList do
  defstruct tasks: []

  def start do
    loop(%TodoList{})
  end

  def add_task(task, todo_list) do
    IO.puts("Tarefa adicionada com sucesso!!")

    %TodoList{tasks: todo_list.tasks ++ [{task, :incomplete}]}
    |> loop()
  end

  def list_tasks(todo_list) do
    IO.puts("Tarefas:")

    Enum.each(Enum.with_index(todo_list.tasks), fn {{task, status}, index} ->
      if(status === :incomplete) do
        IO.puts("#{index + 1}. [ ] #{task}")
      else
        IO.puts("#{index + 1}. [x] #{task}")
      end
    end)

    loop(todo_list)
  end

  def complete_task(task_number, todo_list) do
    updated_tasks =
      Enum.map(Enum.with_index(todo_list.tasks), fn
        {{task, _status}, index} when index + 1 == task_number -> {task, :complete}
        {task, _} -> task
      end)

    IO.puts("Tarefa completada com sucesso!!")

    %{todo_list | tasks: updated_tasks}
    |> loop()
  end

  def remove_task(task_number, todo_list) do
    updated_tasks =
      Enum.reject(Enum.with_index(todo_list.tasks), fn
        {_task, index} -> index + 1 == task_number
      end)
      |> Enum.map(&elem(&1, 0))

    IO.puts("Tarefa removida com sucesso!!")

    %{todo_list | tasks: updated_tasks}
    |> loop()
  end

  defp loop(todo_list) do
    IO.puts("\n1. Adicionar Tarefa")
    IO.puts("2. Listar Tarefas")
    IO.puts("3. Marcar Tarefa como Concluída")
    IO.puts("4. Remover Tarefa")
    IO.puts("5. Sair")

    case IO.gets("Escolha: ") |> String.trim() |> String.to_integer() do
      1 ->
        IO.gets("Digite a tarefa: ")
        |> add_task(todo_list)

      2 ->
        list_tasks(todo_list)

      3 ->
        IO.gets("Digite o número da tarefa que completou: ")
        |> String.trim()
        |> String.to_integer()
        |> complete_task(todo_list)

      4 ->
        IO.gets("Digite o número da tarefa que deseja remover: ")
        |> String.trim()
        |> String.to_integer()
        |> remove_task(todo_list)

      5 ->
        IO.puts("Saindo!!")
        :ok

      _ ->
        IO.puts("Opção Invalída!!")
        loop(todo_list)
    end
  end
end
