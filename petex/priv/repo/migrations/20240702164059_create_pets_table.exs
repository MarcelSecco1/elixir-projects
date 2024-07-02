defmodule Petex.Repo.Migrations.CreatePetsTable do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add(:age, :integer)
      add(:kind, :string)
      add(:name, :string)
      add(:human_id, references(:humans))

      timestamps()
    end
  end
end
