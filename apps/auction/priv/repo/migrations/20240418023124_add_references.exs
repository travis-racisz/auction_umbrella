defmodule Auction.Repo.Migrations.AddReferences do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
      alter table(:users) do
      add :items , references(:items, on_delete: :nothing)
      end
  end
end
