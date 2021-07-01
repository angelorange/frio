defmodule Frio.Factory do
  use ExMachina.Ecto, repo: Frio.Repo

  use Frio.UserFactory
end