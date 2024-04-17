defmodule Auction.User do
  use Ecto.Schema

  schema "users" do
    field(:email, :string)
    field(:password, :string)
    has_many(:items, Auction.Item)
    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> Ecto.Changeset.cast(attrs, [:username, :email, :password])
    |> Ecto.Changeset.validate_required([:username, :email, :password])
  end
end
