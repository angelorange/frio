defmodule Frio.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :cpf, :string
    field :full_name, :string

    timestamps()
  end

  @required ~w(full_name cpf)a
  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
