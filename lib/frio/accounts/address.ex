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

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:street, :number, :complement, :neighborhood, :city, :state, :postal_code])
    |> validate_required([:street, :number, :complement, :neighborhood, :city, :state, :postal_code])
  end
end
