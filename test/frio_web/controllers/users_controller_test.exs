defmodule FrioWeb.UsersControllerTest do
  use FrioWeb.ConnCase
  import Frio.Factory

  alias Frio.Accounts

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.users_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create users" do
    test "renders users when data is valid", %{conn: conn} do
      user = insert(:user)
      params = %{
        cpf: Faker.Lorem.word(),
        full_name: Faker.Person.PtBr.name()
      }
      conn = post(conn, Routes.users_path(conn, :create), users: params)

      assert expected = json_response(conn, 201)["data"]
      assert expected["cpf"] == params.cpf 
      assert expected["full_name"] == params.full_name
    end

    test "renders errors when data is invalid", %{conn: conn} do
      params = %{
        cpf: nil,
        full_name: nil
      }
      conn = post(conn, Routes.users_path(conn, :create), users: params)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update users" do
    setup [:create_users]
    
    test "renders users when data is valid", %{conn: conn, users: %Users{id: id} = users} do
      user = insert(:user)
      params = %{
        cpf: Faker.Lorem.word(),
        full_name: Faker.Person.PtBr.name()
      }

      conn = put(conn, Routes.users_path(conn, :update, users), users: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.users_path(conn, :show, id))

      assert expected = json_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, users: users} do
      conn = put(conn, Routes.users_path(conn, :update, users), users: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  # describe "delete users" do
  #   setup [:create_users]

  #   test "deletes chosen users", %{conn: conn, users: users} do
  #     conn = delete(conn, Routes.users_path(conn, :delete, users))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.users_path(conn, :show, users))
  #     end
  #   end
  # end
end
