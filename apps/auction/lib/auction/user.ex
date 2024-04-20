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
    |> Ecto.Changeset.cast(attrs, [:email, :password])
    |> Ecto.Changeset.validate_required([:email, :password])
    |> Ecto.Changeset.unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    Ecto.Changeset.change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
