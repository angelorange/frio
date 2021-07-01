defmodule FrioWeb.UsersView do
  use FrioWeb, :view
  alias FrioWeb.UsersView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id,
      full_name: users.full_name,
      cpf: users.cpf}
  end
end
