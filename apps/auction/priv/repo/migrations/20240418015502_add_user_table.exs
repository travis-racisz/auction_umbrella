defmodule Auction.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
  create table(:users) do
      add :email, :string
      add :password, :string
      timestamps()
          
    end
  end
end
