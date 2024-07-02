defmodule Petex.Human do
  use Ecto.Schema
  import Ecto.Changeset

  alias Petex.Pet
  @fields [:age, :cpf, :email, :name]

  schema "humans" do
    field :age, :integer
    field :cpf, :string
    field :email, :string
    field :name, :string

    has_many :pets, Pet

    timestamps()
  end

  def changeset(params) do
    # mesma coisa que %Petex.Human{}
    %__MODULE__{}
    |> cast(params, @fields)
    # todos os campos required
    |> validate_required(@fields)
    # idade maior ou igual a 18
    |> validate_number(:age, greater_than_or_equal_to: 18)
    # min 2 caracteres no nome
    |> validate_length(:name, min: 2)
  end
end
