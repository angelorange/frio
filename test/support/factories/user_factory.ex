defmodule Frio.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %Frio.Accounts.Users{
          full_name: Faker.Person.PtBr.name(),
          cpf: Faker.Lorem.word(),
        }
      end
    end
  end
end
