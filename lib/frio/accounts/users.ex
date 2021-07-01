defmodule Frio.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :cpf, :string
    field :full_name, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:full_name, :cpf])
    |> validate_required([:full_name, :cpf])
  end
end
