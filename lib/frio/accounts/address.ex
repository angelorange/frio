defmodule Frio.Accounts.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :city, :string
    field :complement, :string
    field :neighborhood, :string
    field :number, :string
    field :postal_code, :string
    field :state, :string
    field :street, :string

    timestamps()
  end

  @optional ~w(number complement)a
  @required ~w(city state postal_code state neighborhood street)a
  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required ++ @optional)
  end
end
