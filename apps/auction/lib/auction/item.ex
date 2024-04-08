defmodule Auction.Item do
  use Ecto.Schema

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:price, :integer)
    field(:ends_at, :utc_datetime)
  end
end
