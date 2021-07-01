defmodule Frio.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :street, :string
      add :number, :string
      add :complement, :string
      add :neighborhood, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string

      timestamps()
    end

  end
end
