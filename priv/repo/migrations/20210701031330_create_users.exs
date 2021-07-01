defmodule Frio.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :full_name, :string
      add :cpf, :string

      timestamps()
    end

  end
end
