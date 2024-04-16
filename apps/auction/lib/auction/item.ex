defmodule Auction.Item do
  use Ecto.Schema

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:price, :integer)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(item, attrs \\ %{}) do
    item
    |> Ecto.Changeset.cast(attrs, [:title, :description, :price])
    |> Ecto.Changeset.validate_required([:title, :description, :price])
  end
end
