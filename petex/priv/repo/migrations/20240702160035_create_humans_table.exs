defmodule Petex.Repo.Migrations.CreateHumansTable do
  use Ecto.Migration

  def change do
    create table(:humans) do
      add(:age, :integer)
      add(:cpf, :string)
      add(:email, :string)
      add(:name, :string)

      timestamps()
    end

    create unique_index(:humans, [:cpf])
    create unique_index(:humans, [:email])
  end
end
