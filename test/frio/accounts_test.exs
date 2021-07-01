defmodule Frio.AccountsTest do
  use Frio.DataCase

  alias Frio.Accounts

  describe "users" do
    alias Frio.Accounts.Users

    @valid_attrs %{cpf: "some cpf", full_name: "some full_name"}
    @update_attrs %{cpf: "some updated cpf", full_name: "some updated full_name"}
    @invalid_attrs %{cpf: nil, full_name: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_users()

      users
    end

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Accounts.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Accounts.create_users(@valid_attrs)
      assert users.cpf == "some cpf"
      assert users.full_name == "some full_name"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Accounts.update_users(users, @update_attrs)
      assert users.cpf == "some updated cpf"
      assert users.full_name == "some updated full_name"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end

  describe "addresses" do
    alias Frio.Accounts.Address

    @valid_attrs %{city: "some city", complement: "some complement", neighborhood: "some neighborhood", number: "some number", postal_code: "some postal_code", state: "some state", street: "some street"}
    @update_attrs %{city: "some updated city", complement: "some updated complement", neighborhood: "some updated neighborhood", number: "some updated number", postal_code: "some updated postal_code", state: "some updated state", street: "some updated street"}
    @invalid_attrs %{city: nil, complement: nil, neighborhood: nil, number: nil, postal_code: nil, state: nil, street: nil}

    def address_fixture(attrs \\ %{}) do
      {:ok, address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_address()

      address
    end

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Accounts.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Accounts.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      assert {:ok, %Address{} = address} = Accounts.create_address(@valid_attrs)
      assert address.city == "some city"
      assert address.complement == "some complement"
      assert address.neighborhood == "some neighborhood"
      assert address.number == "some number"
      assert address.postal_code == "some postal_code"
      assert address.state == "some state"
      assert address.street == "some street"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      assert {:ok, %Address{} = address} = Accounts.update_address(address, @update_attrs)
      assert address.city == "some updated city"
      assert address.complement == "some updated complement"
      assert address.neighborhood == "some updated neighborhood"
      assert address.number == "some updated number"
      assert address.postal_code == "some updated postal_code"
      assert address.state == "some updated state"
      assert address.street == "some updated street"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_address(address, @invalid_attrs)
      assert address == Accounts.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Accounts.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Accounts.change_address(address)
    end
  end
end
